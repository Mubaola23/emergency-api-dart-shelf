import 'dart:io';

import 'package:crud_rest_api_shelf/middleware/auth_middleware.dart';
import 'package:crud_rest_api_shelf/routes/authentication_route.dart';
import 'package:crud_rest_api_shelf/routes/situation_report_route.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  // Create a single main router
  final router = Router()
    // Public routes are mounted under '/auth'
    ..mount('/auth', AuthRoute.router.call)
    // Protected routes are mounted under '/api' and wrapped in the auth middleware
    ..mount(
      '/api',
      const Pipeline().addMiddleware(authMiddleware()).addHandler(
            SituationReportRoute.router.call,
          ),
    );

  // Create handler
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(router.call);

  // Start server
  final port = int.parse(Platform.environment['PORT'] ?? '3000');
  final server = await serve(handler, InternetAddress.anyIPv4, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
