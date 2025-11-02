import 'dart:convert';

import 'package:crud_rest_api_shelf/data/agency_database.dart';
import 'package:drift/drift.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

final _agencyDb = AgencyDatabase();

class AgencyRoute {
  static Router get router {
    final router = Router();

    router.post('/agency/add', (Request request) async {
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

        // Extract fields for Agency

        final name = (params['name'] as String?)?.trim() ?? '';
        final phoneNumber = (params['phoneNumber'] as String?)?.trim() ?? '';
        final emailAddress = (params['emailAddress'] as String?)?.trim() ?? '';
        final longitude = params['longitude'] is num
            ? params['longitude'] as num
            : (params['longitude'] is String
                ? num.tryParse(params['longitude'] as String)
                : null);
        final latitude = params['latitude'] is num
            ? params['latitude'] as num
            : (params['latitude'] is String
                ? num.tryParse(params['latitude'] as String)
                : null);
        final address = (params['address'] as String?)?.trim() ?? '';
        // Additional fields expected by situation report
        final userId = (params['userId'] as String?)?.trim() ?? '';
        final type = (params['type'] as String?)?.trim() ?? '';
        final status = (params['status'] as String?)?.trim() ?? '';

        // Ensure no required field is missing
        final missingFields = <String>[];
        if (userId.isEmpty) missingFields.add('userId');
        if (type.isEmpty) missingFields.add('type');
        if (address.isEmpty) missingFields.add('address');
        if (status.isEmpty) missingFields.add('status');
        if (latitude == null) missingFields.add('latitude');
        if (longitude == null) missingFields.add('longitude');
        if (name.isEmpty) missingFields.add('name');
        if (phoneNumber.isEmpty) missingFields.add('phoneNumber');
        if (emailAddress.isEmpty) missingFields.add('emailAddress');

        if (missingFields.isNotEmpty) {
          return Response.badRequest(
            body: jsonEncode({
              "statusCode": 400,
              "error": 'Missing required fields: ${missingFields.join(', ')}'
            }),
          );
        }

        // Validate agency if it exists
        final query = _agencyDb.select(_agencyDb.agencyTable)
          ..where((tbl) => tbl.name.equals(name));
        final existingAgency = await query.get();

        if (existingAgency.isNotEmpty) {
          return Response(409,
              body: jsonEncode({
                "statusCode": 409,
                "error": 'Agency with this name already exists.'
              }));
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

        // All validations passed, create new agency record
        final newAgency = AgencyTableCompanion(
          id: Value(const Uuid().v4()),
          name: Value(name),
          phoneNumber: Value(phoneNumber),
          emailAddress: Value(emailAddress),
          latitude: Value(latitude.toDouble()),
          longitude: Value(longitude.toDouble()),
          address: Value(address),
          createdAt: Value(DateTime.now()),
        );

        await _agencyDb.into(_agencyDb.agencyTable).insert(newAgency);
        return Response.ok(
          jsonEncode(
              {"statusCode": 200, 'message': 'Agency created successfully.'}),
        );
      } catch (e) {
        return Response.internalServerError(
            body: jsonEncode(
                {"statusCode": 500, "error": 'Internal server error.'}));
      }
    });

    router.post('/agency/update', (Request request) async {
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

        // Extract fields for Agency
        final id = (params['id'] as String?)?.trim() ?? '';
        final name = (params['name'] as String?)?.trim() ?? '';
        final phoneNumber = (params['phoneNumber'] as String?)?.trim() ?? '';
        final emailAddress = (params['emailAddress'] as String?)?.trim() ?? '';
        final longitude = params['longitude'] is num
            ? params['longitude'] as num
            : (params['longitude'] is String
                ? num.tryParse(params['longitude'] as String)
                : null);
        final latitude = params['latitude'] is num
            ? params['latitude'] as num
            : (params['latitude'] is String
                ? num.tryParse(params['latitude'] as String)
                : null);
        final address = (params['address'] as String?)?.trim() ?? '';

        // Ensure no required field is missing
        final missingFields = <String>[];
        // if (userId.isEmpty) missingFields.add('userId');
        // if (type.isEmpty) missingFields.add('type');
        // if (address.isEmpty) missingFields.add('address');
        // if (status.isEmpty) missingFields.add('status');
        // if (latitude == null) missingFields.add('latitude');
        // if (longitude == null) missingFields.add('longitude');
        // if (name.isEmpty) missingFields.add('name');
        // if (phoneNumber.isEmpty) missingFields.add('phoneNumber');
        // if (emailAddress.isEmpty) missingFields.add('emailAddress');
        if (id.isEmpty) missingFields.add('id');

        if (missingFields.isNotEmpty) {
          return Response.badRequest(
            body: jsonEncode({
              "statusCode": 400,
              "error": 'Missing required fields: ${missingFields.join(', ')}'
            }),
          );
        }

        // Validate agency if it exists
        final query = _agencyDb.select(_agencyDb.agencyTable)
          ..where((tbl) => tbl.name.equals(name));
        final existingAgency = await query.get();

        if (existingAgency.isEmpty) {
          return Response(409,
              body: jsonEncode(
                  {"statusCode": 409, "error": 'Agency not found.'}));
        }

        // Validate coordinates
        if (latitude != null || longitude != null) {
          if (latitude is! num || longitude is! num) {
            return Response.badRequest(
              body: jsonEncode({
                "statusCode": 400,
                "error": 'Latitude and longitude must be numeric values.'
              }),
            );
          }
        }
        // All validations passed, create new agency record
        final newAgency = AgencyTableCompanion(
          // id: Value(const Uuid().v4()),
          name: name.isEmpty ? Value(existingAgency.first.name) : Value(name),
          phoneNumber: phoneNumber.isEmpty
              ? Value(existingAgency.first.phoneNumber)
              : Value(phoneNumber),
          emailAddress: emailAddress.isEmpty
              ? Value(existingAgency.first.emailAddress)
              : Value(emailAddress),
          latitude: latitude != null
              ? Value(latitude.toDouble())
              : Value(existingAgency.first.latitude),
          longitude: longitude != null
              ? Value(longitude.toDouble())
              : Value(existingAgency.first.longitude),
          address: address.isEmpty
              ? Value(existingAgency.first.address)
              : Value(address),
          createdAt: Value(DateTime.now()),
        );

        _agencyDb.update(_agencyDb.agencyTable)
          ..where((agency) => agency.id.equals(id))
          ..write(newAgency);
        return Response.ok(
          jsonEncode(
              {"statusCode": 200, 'message': 'Agency updated successfully.'}),
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
