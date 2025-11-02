// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_database.dart';

// ignore_for_file: type=lint
class $AgencyTableTable extends AgencyTable
    with TableInfo<$AgencyTableTable, AgencyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgencyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailAddressMeta =
      const VerificationMeta('emailAddress');
  @override
  late final GeneratedColumn<String> emailAddress = GeneratedColumn<String>(
      'email_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
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
        name,
        phoneNumber,
        emailAddress,
        longitude,
        latitude,
        address,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'agency_table';
  @override
  VerificationContext validateIntegrity(Insertable<AgencyTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('email_address')) {
      context.handle(
          _emailAddressMeta,
          emailAddress.isAcceptableOrUnknown(
              data['email_address']!, _emailAddressMeta));
    } else if (isInserting) {
      context.missing(_emailAddressMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AgencyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AgencyTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      emailAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email_address'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AgencyTableTable createAlias(String alias) {
    return $AgencyTableTable(attachedDatabase, alias);
  }
}

class AgencyTableData extends DataClass implements Insertable<AgencyTableData> {
  final String id;
  final String name;
  final String phoneNumber;
  final String emailAddress;
  final double? longitude;
  final double? latitude;
  final String address;
  final DateTime createdAt;
  const AgencyTableData(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.emailAddress,
      this.longitude,
      this.latitude,
      required this.address,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['email_address'] = Variable<String>(emailAddress);
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    map['address'] = Variable<String>(address);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AgencyTableCompanion toCompanion(bool nullToAbsent) {
    return AgencyTableCompanion(
      id: Value(id),
      name: Value(name),
      phoneNumber: Value(phoneNumber),
      emailAddress: Value(emailAddress),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      address: Value(address),
      createdAt: Value(createdAt),
    );
  }

  factory AgencyTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AgencyTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      address: serializer.fromJson<String>(json['address']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'longitude': serializer.toJson<double?>(longitude),
      'latitude': serializer.toJson<double?>(latitude),
      'address': serializer.toJson<String>(address),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AgencyTableData copyWith(
          {String? id,
          String? name,
          String? phoneNumber,
          String? emailAddress,
          Value<double?> longitude = const Value.absent(),
          Value<double?> latitude = const Value.absent(),
          String? address,
          DateTime? createdAt}) =>
      AgencyTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        emailAddress: emailAddress ?? this.emailAddress,
        longitude: longitude.present ? longitude.value : this.longitude,
        latitude: latitude.present ? latitude.value : this.latitude,
        address: address ?? this.address,
        createdAt: createdAt ?? this.createdAt,
      );
  AgencyTableData copyWithCompanion(AgencyTableCompanion data) {
    return AgencyTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      emailAddress: data.emailAddress.present
          ? data.emailAddress.value
          : this.emailAddress,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      address: data.address.present ? data.address.value : this.address,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AgencyTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phoneNumber, emailAddress,
      longitude, latitude, address, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgencyTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber &&
          other.emailAddress == this.emailAddress &&
          other.longitude == this.longitude &&
          other.latitude == this.latitude &&
          other.address == this.address &&
          other.createdAt == this.createdAt);
}

class AgencyTableCompanion extends UpdateCompanion<AgencyTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phoneNumber;
  final Value<String> emailAddress;
  final Value<double?> longitude;
  final Value<double?> latitude;
  final Value<String> address;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AgencyTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AgencyTableCompanion.insert({
    required String id,
    required String name,
    required String phoneNumber,
    required String emailAddress,
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
    required String address,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        phoneNumber = Value(phoneNumber),
        emailAddress = Value(emailAddress),
        address = Value(address);
  static Insertable<AgencyTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<String>? emailAddress,
    Expression<double>? longitude,
    Expression<double>? latitude,
    Expression<String>? address,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (emailAddress != null) 'email_address': emailAddress,
      if (longitude != null) 'longitude': longitude,
      if (latitude != null) 'latitude': latitude,
      if (address != null) 'address': address,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AgencyTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? phoneNumber,
      Value<String>? emailAddress,
      Value<double?>? longitude,
      Value<double?>? latitude,
      Value<String>? address,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AgencyTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgencyTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AgencyDatabase extends GeneratedDatabase {
  _$AgencyDatabase(QueryExecutor e) : super(e);
  $AgencyDatabaseManager get managers => $AgencyDatabaseManager(this);
  late final $AgencyTableTable agencyTable = $AgencyTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [agencyTable];
}

typedef $$AgencyTableTableCreateCompanionBuilder = AgencyTableCompanion
    Function({
  required String id,
  required String name,
  required String phoneNumber,
  required String emailAddress,
  Value<double?> longitude,
  Value<double?> latitude,
  required String address,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$AgencyTableTableUpdateCompanionBuilder = AgencyTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> phoneNumber,
  Value<String> emailAddress,
  Value<double?> longitude,
  Value<double?> latitude,
  Value<String> address,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AgencyTableTableFilterComposer
    extends Composer<_$AgencyDatabase, $AgencyTableTable> {
  $$AgencyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emailAddress => $composableBuilder(
      column: $table.emailAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AgencyTableTableOrderingComposer
    extends Composer<_$AgencyDatabase, $AgencyTableTable> {
  $$AgencyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emailAddress => $composableBuilder(
      column: $table.emailAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AgencyTableTableAnnotationComposer
    extends Composer<_$AgencyDatabase, $AgencyTableTable> {
  $$AgencyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get emailAddress => $composableBuilder(
      column: $table.emailAddress, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AgencyTableTableTableManager extends RootTableManager<
    _$AgencyDatabase,
    $AgencyTableTable,
    AgencyTableData,
    $$AgencyTableTableFilterComposer,
    $$AgencyTableTableOrderingComposer,
    $$AgencyTableTableAnnotationComposer,
    $$AgencyTableTableCreateCompanionBuilder,
    $$AgencyTableTableUpdateCompanionBuilder,
    (
      AgencyTableData,
      BaseReferences<_$AgencyDatabase, $AgencyTableTable, AgencyTableData>
    ),
    AgencyTableData,
    PrefetchHooks Function()> {
  $$AgencyTableTableTableManager(_$AgencyDatabase db, $AgencyTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AgencyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AgencyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AgencyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String> emailAddress = const Value.absent(),
            Value<double?> longitude = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AgencyTableCompanion(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            emailAddress: emailAddress,
            longitude: longitude,
            latitude: latitude,
            address: address,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String phoneNumber,
            required String emailAddress,
            Value<double?> longitude = const Value.absent(),
            Value<double?> latitude = const Value.absent(),
            required String address,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AgencyTableCompanion.insert(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            emailAddress: emailAddress,
            longitude: longitude,
            latitude: latitude,
            address: address,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AgencyTableTableProcessedTableManager = ProcessedTableManager<
    _$AgencyDatabase,
    $AgencyTableTable,
    AgencyTableData,
    $$AgencyTableTableFilterComposer,
    $$AgencyTableTableOrderingComposer,
    $$AgencyTableTableAnnotationComposer,
    $$AgencyTableTableCreateCompanionBuilder,
    $$AgencyTableTableUpdateCompanionBuilder,
    (
      AgencyTableData,
      BaseReferences<_$AgencyDatabase, $AgencyTableTable, AgencyTableData>
    ),
    AgencyTableData,
    PrefetchHooks Function()>;

class $AgencyDatabaseManager {
  final _$AgencyDatabase _db;
  $AgencyDatabaseManager(this._db);
  $$AgencyTableTableTableManager get agencyTable =>
      $$AgencyTableTableTableManager(_db, _db.agencyTable);
}
