import 'dart:io';

import 'package:crud_rest_api_shelf/core/constants.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  static Future<bool> sendVerificationEmail(
      {required String recipientEmail,
      required String token,
      String emailSubject = 'Verify Your Email Address'}) async {
    final gmailEmail = Platform.environment['GMAIL_EMAIL'];
    final gmailAppPassword = Platform.environment['GMAIL_APP_PASSWORD'];

    if (gmailEmail == null || gmailAppPassword == null) {
      return false;
    }
    print("$gmailEmail-$gmailAppPassword");
    final smtpServer = gmail(gmailEmail, gmailAppPassword);

    final message = Message()
      ..from = Address(gmailEmail, AppConstants.appName)
      ..recipients.add(recipientEmail)
      ..subject = emailSubject
      ..text = 'Your verification code is: $token';

    try {
      await send(message, smtpServer);

      return true;
    } on MailerException catch (_) {
      return false;
    }
  }
}
