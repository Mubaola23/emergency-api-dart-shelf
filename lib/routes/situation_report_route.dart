import 'dart:convert';

import 'package:crud_rest_api_shelf/core/enum.dart';
import 'package:crud_rest_api_shelf/data/authentication_database.dart';
import 'package:crud_rest_api_shelf/data/situation_report_database.dart';
import 'package:drift/drift.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

final _userDb = UserDatabase();
final _situationDb = SituationDatabase();

class SituationReportRoute {
  static Router get router {
    final router = Router();

    router.post('/api/emergency/report', (Request request) async {
      try {
        final Map<String, dynamic> params;
        final body = await request.readAsString();

        if (body.isEmpty) {
          return Response.badRequest(
              body: jsonEncode({
            "statusCode": 400,
            "error": 'Request body cannot be empty.'
          }));
        }

        try {
          params = jsonDecode(body) as Map<String, dynamic>;
        } catch (e) {
          return Response.badRequest(
              body: jsonEncode(
                  {"statusCode": 400, "error": 'Invalid JSON format.'}));
        }

        // Extract fields for SituationReport
        final userId = (params['userId'] as String?)?.trim() ?? '';
        final type = (params['type'] as String?)?.trim() ?? '';
        final latitude = params['latitude'] is num
            ? params['latitude'] as num
            : (params['latitude'] is String
                ? num.tryParse(params['latitude'] as String)
                : null);
        final longitude = params['longitude'] is num
            ? params['longitude'] as num
            : (params['longitude'] is String
                ? num.tryParse(params['longitude'] as String)
                : null);
        final address = (params['address'] as String?)?.trim() ?? '';
        final agency = (params['agency'] as String?)?.trim() ?? '';
        final status = (params['status'] as String?)?.trim() ?? '';

        // Ensure no required field is missing
        final missingFields = <String>[];
        if (userId.isEmpty) missingFields.add('userId');
        if (type.isEmpty) missingFields.add('type');
        if (address.isEmpty) missingFields.add('address');
        if (agency.isEmpty) missingFields.add('agency');
        if (status.isEmpty) missingFields.add('status');
        if (latitude == null) missingFields.add('latitude');
        if (longitude == null) missingFields.add('longitude');

        if (missingFields.isNotEmpty) {
          return Response.badRequest(
            body: jsonEncode({
              "statusCode": 400,
              "error": 'Missing required fields: ${missingFields.join(', ')}'
            }),
          );
        }

        // Validate user id if it exists
        final query = _userDb.select(_userDb.authenticationTable)
          ..where((tbl) => tbl.id.equals(userId));
        final existingUser = await query.get();

        if (existingUser.isEmpty) {
          return Response(409,
              body:
                  jsonEncode({"statusCode": 400, "error": 'User not found.'}));
        }

        //validate emergency type
        final validTypes = SituationReportType.values
            .map((e) => e.toString().split('.').last)
            .toList();
        if (!validTypes.contains(type.toLowerCase())) {
          return Response.badRequest(
            body: jsonEncode({
              "statusCode": 400,
              "error":
                  'Invalid emergency type. Valid types are: ${validTypes.join(', ')}'
            }),
          );
        }

        // Validate coordinates
        if (latitude is! num || longitude is! num) {
          return Response.badRequest(
            body: jsonEncode({
              "statusCode": 400,
              "error": 'Latitude and longitude must be numeric values.'
            }),
          );
        }

        //TODO: Continue from here to validate agency  and insert the report into the database.

        // All validations passed, create new situation report record
        final newReport = SituationReportTableCompanion(
          id: Value(const Uuid().v4()),
          userId: Value(userId),
          type: Value(type.toLowerCase()),
          latitude: Value(latitude.toDouble()),
          longitude: Value(longitude.toDouble()),
          address: Value(address),
          agency: Value(agency.toLowerCase()),
          status:
              Value(SituationReportStatus.pending.toString().split('.').last),
          createdAt: Value(DateTime.now()),
        );
        await _situationDb
            .into(_situationDb.situationReportTable)
            .insert(newReport);
        return Response.ok(
          jsonEncode({
            "statusCode": 200,
            'message': 'Situation report submitted successfully.'
          }),
        );
      } catch (e) {
        return Response.internalServerError(
            body: jsonEncode(
                {"statusCode": 500, "error": 'Internal server error.'}));
      }
    });

    router.post('/api/emergency/update-report', (Request request) async {
      try {
        final Map<String, dynamic> params;
        final body = await request.readAsString();

        if (body.isEmpty) {
          return Response.badRequest(
              body: jsonEncode({
            "statusCode": 400,
            "error": 'Request body cannot be empty.'
          }));
        }

        try {
          params = jsonDecode(body) as Map<String, dynamic>;
        } catch (e) {
          return Response.badRequest(
              body: jsonEncode(
                  {"statusCode": 400, "error": 'Invalid JSON format.'}));
        }

        // Extract fields for SituationReport

        final reportId = (params['reportd'] as String?)?.trim() ?? '';
        final status = (params['status'] as String?)?.trim() ?? '';

        // Ensure no required field is missing
        final missingFields = <String>[];
        if (reportId.isEmpty) missingFields.add('reportId');
        if (status.isEmpty) missingFields.add('status');

        if (missingFields.isNotEmpty) {
          return Response.badRequest(
            body: jsonEncode({
              "statusCode": 400,
              "error": 'Missing required fields: ${missingFields.join(', ')}'
            }),
          );
        }

        // Validate report id  exists
        final query = _situationDb.select(_situationDb.situationReportTable)
          ..where((tbl) => tbl.id.equals(reportId));
        final existingReport = await query.get();

        if (existingReport.isEmpty) {
          return Response(409,
              body: jsonEncode(
                  {"statusCode": 400, "error": 'Report not found.'}));
        }

        //validate emergency status to be updated
        final validStatuses = SituationReportStatus.values
            .map((e) => e.toString().split('.').last)
            .toList();
        if (!validStatuses.contains(status.toLowerCase())) {
          return Response.badRequest(
            body: jsonEncode({
              "statusCode": 400,
              "error":
                  'Invalid emergency status. Valid statuses are: ${validStatuses.join(', ')}'
            }),
          );
        }

        // All validations passed, create new situation report record
        _situationDb.update(_situationDb.situationReportTable)
          ..where((report) => report.id.equals(reportId))
          ..write(existingReport.first.copyWith(status: status));
        return Response.ok(
          jsonEncode({
            "statusCode": 200,
            'message': 'Situation report status updated successfully.'
          }),
        );
      } catch (e) {
        return Response.internalServerError(
            body: jsonEncode(
                {"statusCode": 500, "error": 'Internal server error.'}));
      }
    });

    return router;
  }
}
