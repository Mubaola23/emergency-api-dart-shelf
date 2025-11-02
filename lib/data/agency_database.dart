import 'dart:core';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqlite3/sqlite3.dart';

part 'agency_database.g.dart';

class AgencyTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  TextColumn get phoneNumber => text()();
  TextColumn get emailAddress => text()();
  RealColumn get longitude => real().nullable()();
  RealColumn get latitude => real().nullable()();
  TextColumn get address => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [AgencyTable])
class AgencyDatabase extends _$AgencyDatabase {
  // dart run build_runner build
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AgencyDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.opened(sqlite3.open('evil-joy.db'));
  }
}
