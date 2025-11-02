import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bcrypt/bcrypt.dart';
import 'package:crud_rest_api_shelf/data/authentication_database.dart';
import 'package:crud_rest_api_shelf/services/email_service.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:drift/drift.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:uuid/uuid.dart';

final _db = UserDatabase();

class AuthRoute {
  static Router get router {
    final router = Router();

    /// User registration route
    router.post('/auth/register', (Request request) async {
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

        // Extract and validate all required fields
        final firstName = (params['firstName'] as String?)?.trim() ?? '';
        final lastName = (params['lastName'] as String?)?.trim() ?? '';
        final email = (params['email'] as String?)?.trim() ?? '';
        final password = (params['password'] as String?)?.trim() ?? '';
        final phoneNumber = (params['phoneNumber'] as String?)?.trim() ?? '';
        final picture = (params['picture'] as String?)?.trim() ?? '';
        final address = (params['address'] as String?)?.trim() ?? '';
        final latitude = params['latitude'];
        final longitude = params['longitude'];

        // Ensure no required field is missing
        final missingFields = <String>[];
        if (firstName.isEmpty) missingFields.add('firstName');
        if (lastName.isEmpty) missingFields.add('lastName');
        if (email.isEmpty) missingFields.add('email');
        if (password.isEmpty) missingFields.add('password');
        if (phoneNumber.isEmpty) missingFields.add('phoneNumber');
        if (picture.isEmpty) missingFields.add('picture');
        if (address.isEmpty) missingFields.add('address');
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

        // Validate email format
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(email)) {
          return Response.badRequest(
            body: jsonEncode(
                {"statusCode": 400, "error": 'Invalid email format.'}),
          );
        }

        // Validate phone number (basic check)
        final phoneRegex = RegExp(r'^[0-9+\-\s]{7,15}$');
        if (!phoneRegex.hasMatch(phoneNumber)) {
          return Response.badRequest(
            body: jsonEncode(
                {"statusCode": 400, "error": 'Invalid phone number format.'}),
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

        // Password strength validation
        if (password.length < 8) {
          return Response.badRequest(
            body: jsonEncode({
              "statusCode": 400,
              "error": 'Password must be at least 8 characters long.'
            }),
          );
        }

        // Check if user already exists
        final query = _db.select(_db.authenticationTable)
          ..where((tbl) => tbl.email.equals(email));
        final existingUsers = await query.get();

        if (existingUsers.isNotEmpty) {
          return Response(
            409,
            body: jsonEncode({
              "statusCode": 400,
              "error": 'User with this email already exists.'
            }),
          );
        }

        // Hash password
        final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        // Generate a 6-digit random token for verification.
        final token = (100000 + Random().nextInt(900000)).toString();
        // Create new user record
        final newUser = AuthenticationTableCompanion(
            id: Value(const Uuid().v4()),
            firstName: Value(firstName),
            lastName: Value(lastName),
            email: Value(email.toLowerCase()),
            password: Value(hashedPassword),
            phoneNumber: Value(phoneNumber),
            picture: Value(picture),
            address: Value(address),
            latitude: Value(latitude.toDouble()),
            longitude: Value(longitude.toDouble()),
            createdAt: Value(DateTime.now()),
            isVerified: Value(false),
            tokenExpiry: Value(DateTime.now()),
            verificationToken: Value(token));

        var verificationEmail = await EmailService.sendVerificationEmail(
            recipientEmail: newUser.email.value, token: token);
        if (!verificationEmail) {
          return Response.internalServerError(
            body: jsonEncode({
              "statusCode": 500,
              "error": 'Unable to send verification OTP'
            }),
          );
        }
        await _db.into(_db.authenticationTable).insert(newUser);

        return Response.ok(
          jsonEncode({
            "statusCode": 200,
            'message':
                'User created successfully and email verification has been sent.'
          }),
        );
      } catch (e) {
        return Response.internalServerError(
            body: jsonEncode(
                {"statusCode": 500, "error": 'Internal server error.'}));
      }
    });

    /// User Login route
    router.post('/auth/login', (Request request) async {
      try {
        final Map<String, dynamic> params;

        final body = await request.readAsString();
        try {
          params = jsonDecode(body) as Map<String, dynamic>;
        } catch (e) {
          return Response.badRequest(
              body: jsonEncode(
                  {"statusCode": 400, "error": 'Invalid JSON format.'}));
        }
        final email = (params['email'] as String? ?? '').toLowerCase();
        final password = params['password'] as String? ?? '';

        // Checks if any of the input is empty
        if (email.isEmpty || password.isEmpty) {
          return Response.badRequest(
              body:
                  jsonEncode({"statusCode": 400, "error": 'Invalid details'}));
        }

        // Check if user exists
        final query = _db.select(_db.authenticationTable)
          ..where((tbl) => tbl.email.equals(email));
        final existingUsers = await query.get();

        if (existingUsers.isEmpty) {
          return Response(409,
              body:
                  jsonEncode({"statusCode": 400, "error": 'User not found.'}));
        }
        var user = existingUsers.first;
        // Check if the provided password matches the hash
        if (!BCrypt.checkpw(password, user.password)) {
          return Response.unauthorized(
              jsonEncode({"statusCode": 401, "error": 'Incorrect password.'}));
        }

        final jwt = JWT({'id': user.id.toString()});
        final secret = SecretKey(
          Platform.environment['JWT_SECRET_KEY'] ??
              String.fromEnvironment('JWT_SECRET_KEY'),
        );
        final token = jwt.sign(secret, expiresIn: Duration(hours: 1));

        return Response.ok(jsonEncode({
          'statusCode': 200,
          'message': 'Login successfull',
          'data': {'token': token, 'user': user}
        }));
      } catch (e) {
        return Response.internalServerError(
            body: jsonEncode(
                {'statusCode': 500, "message": 'Internal server error.'}));
      }
    });

    /// Send Email Verification Route
    router.post('/auth/sendEmailVerification', (Request request) async {
      try {
        final Map<String, dynamic> params;

        final body = await request.readAsString();
        try {
          params = jsonDecode(body) as Map<String, dynamic>;
        } catch (e) {
          return Response.badRequest(
              body: jsonEncode(
                  {'statusCode': 400, "message": 'Invalid JSON format.'}));
        }
        final email = (params['email'] as String? ?? '').toLowerCase();

        // Checks if email is not empty
        if (email.isEmpty) {
          return Response.badRequest(
              body:
                  jsonEncode({'statusCode': 400, "message": 'Invalid email.'}));
        }

        // Check if user exists
        final query = _db.select(_db.authenticationTable)
          ..where((tbl) => tbl.email.equals(email));
        final existingUsers = await query.get();

        if (existingUsers.isEmpty) {
          return Response(409,
              body: jsonEncode(
                  {'statusCode': 409, "message": 'User not found.'}));
        }
        // Generate a 6-digit random token for verification .
        final token = (100000 + Random().nextInt(900000)).toString();
        var user = existingUsers.first;

        // Updates new token and the expiry in user db
        _db.update(_db.authenticationTable)
          ..where((user) => user.email.equals(email))
          ..write(user.copyWith(
              verificationToken: token,
              tokenExpiry: DateTime.now().add(Duration(minutes: 10))));

        // Sends verification email
        var sendVerification = await EmailService.sendVerificationEmail(
            recipientEmail: user.email, token: token);
        if (!sendVerification) {
          return Response.internalServerError(
              body: jsonEncode({
            'statusCode': 500,
            "message": 'Unable to send verification OTP'
          }));
        }
        return Response.ok(jsonEncode({
          'statusCode': 200,
          "message": 'Verification sent',
          'data': {
            'otp': token,
            'message': 'Email Verification OTP sent sucessfully'
          }
        }));
      } catch (e) {
        return Response.internalServerError(
            body: jsonEncode(
                {'statusCode': 500, "message": 'Internal server error.'}));
      }
    });

    /// Send Email Verification Route
    router.post('/auth/verifyOTP', (Request request) async {
      try {
        final Map<String, dynamic> params;

        final body = await request.readAsString();
        try {
          params = jsonDecode(body) as Map<String, dynamic>;
        } catch (e) {
          return Response(400,
              body: jsonEncode(
                  {'statusCode': 400, "message": 'Invalid JSON format.'}));
        }
        final otp = (params['otp'] as String? ?? '');
        final email = (params['email'] as String? ?? '').toLowerCase();

        // Checks if email is not empty
        if (email.isEmpty) {
          return Response(400,
              body:
                  jsonEncode({'statusCode': 400, "message": 'Invalid email'}));
        }
        // Checks if otp is not empty
        if (otp.isEmpty) {
          return Response(400,
              body: jsonEncode({
                'statusCode': 400,
                "message": 'Enter OTP sent to your email'
              }));
        }

        // Check if user exists
        final query = _db.select(_db.authenticationTable)
          ..where((tbl) => tbl.email.equals(email));
        final existingUsers = await query.get();

        if (existingUsers.isEmpty) {
          return Response(409,
              body: jsonEncode(
                  {'statusCode': 409, "message": 'User not found.'}));
        }

        var user = existingUsers.first;
        // Checks if the supplied otp matches the user otp in db
        if (user.verificationToken != otp) {
          return Response(400,
              body: jsonEncode({'statusCode': 400, "message": 'Invalid OTP'}));
        }
        // Updates verification status tontrue
        _db.update(_db.authenticationTable)
          ..where((user) => user.email.equals(email))
          ..write(user.copyWith(isVerified: true));

        return Response.ok(jsonEncode(
            {'statusCode': 200, 'message': 'Verification  successful'}));
      } catch (e) {
        return Response(500,
            body: jsonEncode(
                {'statusCode': 500, "message": 'Internal server error.'}));
      }
    });

    /// Forgot password: sends OTP to user email
    router.post('/auth/forgotPassword', (Request request) async {
      try {
        final Map<String, dynamic> params;

        final body = await request.readAsString();
        try {
          params = jsonDecode(body) as Map<String, dynamic>;
        } catch (e) {
          return Response(400,
              body: jsonEncode(
                  {'statusCode': 400, "message": 'Invalid JSON format.'}));
        }
        final email = (params['email'] as String? ?? '').toLowerCase();

        // Check if user exists
        final query = _db.select(_db.authenticationTable)
          ..where((tbl) => tbl.email.equals(email));
        final existingUsers = await query.get();

        if (existingUsers.isEmpty) {
          return Response(409,
              body: jsonEncode(
                  {'statusCode': 409, "message": 'User not found.'}));
        }

        // Generate a 6-digit random token for verification .
        final token = (100000 + Random().nextInt(900000)).toString();
        var user = existingUsers.first;
        // Sends verification email
        var sendVerification = await EmailService.sendVerificationEmail(
            recipientEmail: user.email, token: token);
        if (!sendVerification) {
          Response.internalServerError(
              body: jsonEncode({
            'statusCode': 500,
            "message": 'Unable to send verification OTP'
          }));
        }
        return Response.ok(jsonEncode({
          'statusCode': 200,
          'message': 'OTP sent sucessfully',
        }));
      } catch (e) {
        return Response(500,
            body: jsonEncode(
                {'statusCode': 500, "message": 'Internal server error.'}));
      }
    });

    return router;
  }
}
