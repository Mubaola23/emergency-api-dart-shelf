// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'situation_report_database.dart';

// ignore_for_file: type=lint
class $SituationReportDatabaseTable extends SituationReportDatabase
    with TableInfo<$SituationReportDatabaseTable, SituationReportDatabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SituationReportDatabaseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _agencyMeta = const VerificationMeta('agency');
  @override
  late final GeneratedColumn<String> agency = GeneratedColumn<String>(
      'agency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        type,
        latitude,
        longitude,
        address,
        agency,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'situation_report_database';
  @override
  VerificationContext validateIntegrity(
      Insertable<SituationReportDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('agency')) {
      context.handle(_agencyMeta,
          agency.isAcceptableOrUnknown(data['agency']!, _agencyMeta));
    } else if (isInserting) {
      context.missing(_agencyMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SituationReportDatabaseData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SituationReportDatabaseData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      agency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}agency'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SituationReportDatabaseTable createAlias(String alias) {
    return $SituationReportDatabaseTable(attachedDatabase, alias);
  }
}

class SituationReportDatabaseData extends DataClass
    implements Insertable<SituationReportDatabaseData> {
  final int id;
  final String userId;
  final String type;
  final double? latitude;
  final double? longitude;
  final String address;
  final String agency;
  final String status;
  final DateTime createdAt;
  const SituationReportDatabaseData(
      {required this.id,
      required this.userId,
      required this.type,
      this.latitude,
      this.longitude,
      required this.address,
      required this.agency,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    map['address'] = Variable<String>(address);
    map['agency'] = Variable<String>(agency);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SituationReportDatabaseCompanion toCompanion(bool nullToAbsent) {
    return SituationReportDatabaseCompanion(
      id: Value(id),
      userId: Value(userId),
      type: Value(type),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      address: Value(address),
      agency: Value(agency),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory SituationReportDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SituationReportDatabaseData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      address: serializer.fromJson<String>(json['address']),
      agency: serializer.fromJson<String>(json['agency']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'type': serializer.toJson<String>(type),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'address': serializer.toJson<String>(address),
      'agency': serializer.toJson<String>(agency),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SituationReportDatabaseData copyWith(
          {int? id,
          String? userId,
          String? type,
          Value<double?> latitude = const Value.absent(),
          Value<double?> longitude = const Value.absent(),
          String? address,
          String? agency,
          String? status,
          DateTime? createdAt}) =>
      SituationReportDatabaseData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        latitude: latitude.present ? latitude.value : this.latitude,
        longitude: longitude.present ? longitude.value : this.longitude,
        address: address ?? this.address,
        agency: agency ?? this.agency,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  SituationReportDatabaseData copyWithCompanion(
      SituationReportDatabaseCompanion data) {
    return SituationReportDatabaseData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      address: data.address.present ? data.address.value : this.address,
      agency: data.agency.present ? data.agency.value : this.agency,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SituationReportDatabaseData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('agency: $agency, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, type, latitude, longitude,
      address, agency, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SituationReportDatabaseData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.address == this.address &&
          other.agency == this.agency &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class SituationReportDatabaseCompanion
    extends UpdateCompanion<SituationReportDatabaseData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> type;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String> address;
  final Value<String> agency;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const SituationReportDatabaseCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
    this.agency = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SituationReportDatabaseCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String type,
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    required String address,
    required String agency,
    required String status,
    this.createdAt = const Value.absent(),
  })  : userId = Value(userId),
        type = Value(type),
        address = Value(address),
        agency = Value(agency),
        status = Value(status);
  static Insertable<SituationReportDatabaseData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? address,
    Expression<String>? agency,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      if (agency != null) 'agency': agency,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SituationReportDatabaseCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<String>? type,
      Value<double?>? latitude,
      Value<double?>? longitude,
      Value<String>? address,
      Value<String>? agency,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return SituationReportDatabaseCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      agency: agency ?? this.agency,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (agency.present) {
      map['agency'] = Variable<String>(agency.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SituationReportDatabaseCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('agency: $agency, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$SituationDatabase extends GeneratedDatabase {
  _$SituationDatabase(QueryExecutor e) : super(e);
  $SituationDatabaseManager get managers => $SituationDatabaseManager(this);
  late final $SituationReportDatabaseTable situationReportDatabase =
      $SituationReportDatabaseTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [situationReportDatabase];
}

typedef $$SituationReportDatabaseTableCreateCompanionBuilder
    = SituationReportDatabaseCompanion Function({
  Value<int> id,
  required String userId,
  required String type,
  Value<double?> latitude,
  Value<double?> longitude,
  required String address,
  required String agency,
  required String status,
  Value<DateTime> createdAt,
});
typedef $$SituationReportDatabaseTableUpdateCompanionBuilder
    = SituationReportDatabaseCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<String> type,
  Value<double?> latitude,
  Value<double?> longitude,
  Value<String> address,
  Value<String> agency,
  Value<String> status,
  Value<DateTime> createdAt,
});

class $$SituationReportDatabaseTableFilterComposer
    extends Composer<_$SituationDatabase, $SituationReportDatabaseTable> {
  $$SituationReportDatabaseTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get agency => $composableBuilder(
      column: $table.agency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$SituationReportDatabaseTableOrderingComposer
    extends Composer<_$SituationDatabase, $SituationReportDatabaseTable> {
  $$SituationReportDatabaseTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get agency => $composableBuilder(
      column: $table.agency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SituationReportDatabaseTableAnnotationComposer
    extends Composer<_$SituationDatabase, $SituationReportDatabaseTable> {
  $$SituationReportDatabaseTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get agency =>
      $composableBuilder(column: $table.agency, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SituationReportDatabaseTableTableManager extends RootTableManager<
    _$SituationDatabase,
    $SituationReportDatabaseTable,
    SituationReportDatabaseData,
    $$SituationReportDatabaseTableFilterComposer,
    $$SituationReportDatabaseTableOrderingComposer,
    $$SituationReportDatabaseTableAnnotationComposer,
    $$SituationReportDatabaseTableCreateCompanionBuilder,
    $$SituationReportDatabaseTableUpdateCompanionBuilder,
    (
      SituationReportDatabaseData,
      BaseReferences<_$SituationDatabase, $SituationReportDatabaseTable,
          SituationReportDatabaseData>
    ),
    SituationReportDatabaseData,
    PrefetchHooks Function()> {
  $$SituationReportDatabaseTableTableManager(
      _$SituationDatabase db, $SituationReportDatabaseTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SituationReportDatabaseTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$SituationReportDatabaseTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SituationReportDatabaseTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> agency = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SituationReportDatabaseCompanion(
            id: id,
            userId: userId,
            type: type,
            latitude: latitude,
            longitude: longitude,
            address: address,
            agency: agency,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required String type,
            Value<double?> latitude = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            required String address,
            required String agency,
            required String status,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SituationReportDatabaseCompanion.insert(
            id: id,
            userId: userId,
            type: type,
            latitude: latitude,
            longitude: longitude,
            address: address,
            agency: agency,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SituationReportDatabaseTableProcessedTableManager
    = ProcessedTableManager<
        _$SituationDatabase,
        $SituationReportDatabaseTable,
        SituationReportDatabaseData,
        $$SituationReportDatabaseTableFilterComposer,
        $$SituationReportDatabaseTableOrderingComposer,
        $$SituationReportDatabaseTableAnnotationComposer,
        $$SituationReportDatabaseTableCreateCompanionBuilder,
        $$SituationReportDatabaseTableUpdateCompanionBuilder,
        (
          SituationReportDatabaseData,
          BaseReferences<_$SituationDatabase, $SituationReportDatabaseTable,
              SituationReportDatabaseData>
        ),
        SituationReportDatabaseData,
        PrefetchHooks Function()>;

class $SituationDatabaseManager {
  final _$SituationDatabase _db;
  $SituationDatabaseManager(this._db);
  $$SituationReportDatabaseTableTableManager get situationReportDatabase =>
      $$SituationReportDatabaseTableTableManager(
          _db, _db.situationReportDatabase);
}
