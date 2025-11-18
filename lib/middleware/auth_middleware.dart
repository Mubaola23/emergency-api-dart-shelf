import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

Middleware authMiddleware() {
  return (Handler innerHandler) {
    return (Request request) {
      final authHeader = request.headers['authorization'];
      final token = authHeader?.replaceFirst('Bearer ', '');

      if (token == null) {
        return Response.unauthorized('Missing authorization token.');
      }

      final secret = SecretKey(Platform.environment['JWT_SECRET_KEY']!);

      try {
        JWT.verify(token, secret);
        return innerHandler(request);
      } on JWTException catch (e) {
        return Response.unauthorized('Invalid token: ${e.message}');
      }
    };
  };
}
