import 'dart:core';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqlite3/sqlite3.dart';

part 'situation_report_database.g.dart';

class SituationReportDatabase extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();

  TextColumn get type => text()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get address => text()();

  TextColumn get agency => text()();
  TextColumn get status => text()(); // submitted | ongoing | resolved

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [SituationReportDatabase])
class SituationDatabase extends _$SituationDatabase {
  // dart run build_runner build
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  SituationDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.opened(sqlite3.open('evil-joy.db'));
  }
}
