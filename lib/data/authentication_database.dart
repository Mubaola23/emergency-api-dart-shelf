import 'dart:core';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqlite3/sqlite3.dart';

part 'authentication_database.g.dart';

// isVerified: false, // User is not verified on creation.
//         verificationToken: token,
//         tokenExpiry: DateTime.now().add(const Duration(minutes: 15)),

class AuthenticationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get address => text()();
  TextColumn get verificationToken => text()();
  DateTimeColumn get tokenExpiry => dateTime()();

  BoolColumn get isVerified => boolean()();
  TextColumn get lastName => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get picture => text()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [AuthenticationTable])
class UserDatabase extends _$UserDatabase {
  // dart run build_runner build
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  UserDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.opened(sqlite3.open('evil-joy.db'));
  }
}
