// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_database.dart';

// ignore_for_file: type=lint
class $AuthenticationTableTable extends AuthenticationTable
    with TableInfo<$AuthenticationTableTable, AuthenticationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthenticationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _verificationTokenMeta =
      const VerificationMeta('verificationToken');
  @override
  late final GeneratedColumn<String> verificationToken =
      GeneratedColumn<String>('verification_token', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenExpiryMeta =
      const VerificationMeta('tokenExpiry');
  @override
  late final GeneratedColumn<DateTime> tokenExpiry = GeneratedColumn<DateTime>(
      'token_expiry', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isVerifiedMeta =
      const VerificationMeta('isVerified');
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
      'is_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_verified" IN (0, 1))'));
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pictureMeta =
      const VerificationMeta('picture');
  @override
  late final GeneratedColumn<String> picture = GeneratedColumn<String>(
      'picture', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
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
        firstName,
        latitude,
        longitude,
        address,
        verificationToken,
        tokenExpiry,
        isVerified,
        lastName,
        phoneNumber,
        picture,
        email,
        password,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authentication_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AuthenticationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('verification_token')) {
      context.handle(
          _verificationTokenMeta,
          verificationToken.isAcceptableOrUnknown(
              data['verification_token']!, _verificationTokenMeta));
    } else if (isInserting) {
      context.missing(_verificationTokenMeta);
    }
    if (data.containsKey('token_expiry')) {
      context.handle(
          _tokenExpiryMeta,
          tokenExpiry.isAcceptableOrUnknown(
              data['token_expiry']!, _tokenExpiryMeta));
    } else if (isInserting) {
      context.missing(_tokenExpiryMeta);
    }
    if (data.containsKey('is_verified')) {
      context.handle(
          _isVerifiedMeta,
          isVerified.isAcceptableOrUnknown(
              data['is_verified']!, _isVerifiedMeta));
    } else if (isInserting) {
      context.missing(_isVerifiedMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    } else if (isInserting) {
      context.missing(_pictureMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
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
  AuthenticationTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthenticationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      verificationToken: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}verification_token'])!,
      tokenExpiry: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}token_expiry'])!,
      isVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_verified'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      picture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}picture'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AuthenticationTableTable createAlias(String alias) {
    return $AuthenticationTableTable(attachedDatabase, alias);
  }
}

class AuthenticationTableData extends DataClass
    implements Insertable<AuthenticationTableData> {
  final int id;
  final String firstName;
  final double latitude;
  final double longitude;
  final String address;
  final String verificationToken;
  final DateTime tokenExpiry;
  final bool isVerified;
  final String lastName;
  final String phoneNumber;
  final String picture;
  final String email;
  final String password;
  final DateTime createdAt;
  const AuthenticationTableData(
      {required this.id,
      required this.firstName,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.verificationToken,
      required this.tokenExpiry,
      required this.isVerified,
      required this.lastName,
      required this.phoneNumber,
      required this.picture,
      required this.email,
      required this.password,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['address'] = Variable<String>(address);
    map['verification_token'] = Variable<String>(verificationToken);
    map['token_expiry'] = Variable<DateTime>(tokenExpiry);
    map['is_verified'] = Variable<bool>(isVerified);
    map['last_name'] = Variable<String>(lastName);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['picture'] = Variable<String>(picture);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuthenticationTableCompanion toCompanion(bool nullToAbsent) {
    return AuthenticationTableCompanion(
      id: Value(id),
      firstName: Value(firstName),
      latitude: Value(latitude),
      longitude: Value(longitude),
      address: Value(address),
      verificationToken: Value(verificationToken),
      tokenExpiry: Value(tokenExpiry),
      isVerified: Value(isVerified),
      lastName: Value(lastName),
      phoneNumber: Value(phoneNumber),
      picture: Value(picture),
      email: Value(email),
      password: Value(password),
      createdAt: Value(createdAt),
    );
  }

  factory AuthenticationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthenticationTableData(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      address: serializer.fromJson<String>(json['address']),
      verificationToken: serializer.fromJson<String>(json['verificationToken']),
      tokenExpiry: serializer.fromJson<DateTime>(json['tokenExpiry']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
      lastName: serializer.fromJson<String>(json['lastName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      picture: serializer.fromJson<String>(json['picture']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'address': serializer.toJson<String>(address),
      'verificationToken': serializer.toJson<String>(verificationToken),
      'tokenExpiry': serializer.toJson<DateTime>(tokenExpiry),
      'isVerified': serializer.toJson<bool>(isVerified),
      'lastName': serializer.toJson<String>(lastName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'picture': serializer.toJson<String>(picture),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuthenticationTableData copyWith(
          {int? id,
          String? firstName,
          double? latitude,
          double? longitude,
          String? address,
          String? verificationToken,
          DateTime? tokenExpiry,
          bool? isVerified,
          String? lastName,
          String? phoneNumber,
          String? picture,
          String? email,
          String? password,
          DateTime? createdAt}) =>
      AuthenticationTableData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        verificationToken: verificationToken ?? this.verificationToken,
        tokenExpiry: tokenExpiry ?? this.tokenExpiry,
        isVerified: isVerified ?? this.isVerified,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        picture: picture ?? this.picture,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
      );
  AuthenticationTableData copyWithCompanion(AuthenticationTableCompanion data) {
    return AuthenticationTableData(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      address: data.address.present ? data.address.value : this.address,
      verificationToken: data.verificationToken.present
          ? data.verificationToken.value
          : this.verificationToken,
      tokenExpiry:
          data.tokenExpiry.present ? data.tokenExpiry.value : this.tokenExpiry,
      isVerified:
          data.isVerified.present ? data.isVerified.value : this.isVerified,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      picture: data.picture.present ? data.picture.value : this.picture,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthenticationTableData(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('verificationToken: $verificationToken, ')
          ..write('tokenExpiry: $tokenExpiry, ')
          ..write('isVerified: $isVerified, ')
          ..write('lastName: $lastName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('picture: $picture, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      firstName,
      latitude,
      longitude,
      address,
      verificationToken,
      tokenExpiry,
      isVerified,
      lastName,
      phoneNumber,
      picture,
      email,
      password,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthenticationTableData &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.address == this.address &&
          other.verificationToken == this.verificationToken &&
          other.tokenExpiry == this.tokenExpiry &&
          other.isVerified == this.isVerified &&
          other.lastName == this.lastName &&
          other.phoneNumber == this.phoneNumber &&
          other.picture == this.picture &&
          other.email == this.email &&
          other.password == this.password &&
          other.createdAt == this.createdAt);
}

class AuthenticationTableCompanion
    extends UpdateCompanion<AuthenticationTableData> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> address;
  final Value<String> verificationToken;
  final Value<DateTime> tokenExpiry;
  final Value<bool> isVerified;
  final Value<String> lastName;
  final Value<String> phoneNumber;
  final Value<String> picture;
  final Value<String> email;
  final Value<String> password;
  final Value<DateTime> createdAt;
  const AuthenticationTableCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.address = const Value.absent(),
    this.verificationToken = const Value.absent(),
    this.tokenExpiry = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.lastName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.picture = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AuthenticationTableCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required double latitude,
    required double longitude,
    required String address,
    required String verificationToken,
    required DateTime tokenExpiry,
    required bool isVerified,
    required String lastName,
    required String phoneNumber,
    required String picture,
    required String email,
    required String password,
    this.createdAt = const Value.absent(),
  })  : firstName = Value(firstName),
        latitude = Value(latitude),
        longitude = Value(longitude),
        address = Value(address),
        verificationToken = Value(verificationToken),
        tokenExpiry = Value(tokenExpiry),
        isVerified = Value(isVerified),
        lastName = Value(lastName),
        phoneNumber = Value(phoneNumber),
        picture = Value(picture),
        email = Value(email),
        password = Value(password);
  static Insertable<AuthenticationTableData> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? address,
    Expression<String>? verificationToken,
    Expression<DateTime>? tokenExpiry,
    Expression<bool>? isVerified,
    Expression<String>? lastName,
    Expression<String>? phoneNumber,
    Expression<String>? picture,
    Expression<String>? email,
    Expression<String>? password,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (address != null) 'address': address,
      if (verificationToken != null) 'verification_token': verificationToken,
      if (tokenExpiry != null) 'token_expiry': tokenExpiry,
      if (isVerified != null) 'is_verified': isVerified,
      if (lastName != null) 'last_name': lastName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (picture != null) 'picture': picture,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AuthenticationTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<String>? address,
      Value<String>? verificationToken,
      Value<DateTime>? tokenExpiry,
      Value<bool>? isVerified,
      Value<String>? lastName,
      Value<String>? phoneNumber,
      Value<String>? picture,
      Value<String>? email,
      Value<String>? password,
      Value<DateTime>? createdAt}) {
    return AuthenticationTableCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      verificationToken: verificationToken ?? this.verificationToken,
      tokenExpiry: tokenExpiry ?? this.tokenExpiry,
      isVerified: isVerified ?? this.isVerified,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      picture: picture ?? this.picture,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
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
    if (verificationToken.present) {
      map['verification_token'] = Variable<String>(verificationToken.value);
    }
    if (tokenExpiry.present) {
      map['token_expiry'] = Variable<DateTime>(tokenExpiry.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String>(picture.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthenticationTableCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('address: $address, ')
          ..write('verificationToken: $verificationToken, ')
          ..write('tokenExpiry: $tokenExpiry, ')
          ..write('isVerified: $isVerified, ')
          ..write('lastName: $lastName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('picture: $picture, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$UserDatabase extends GeneratedDatabase {
  _$UserDatabase(QueryExecutor e) : super(e);
  $UserDatabaseManager get managers => $UserDatabaseManager(this);
  late final $AuthenticationTableTable authenticationTable =
      $AuthenticationTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [authenticationTable];
}

typedef $$AuthenticationTableTableCreateCompanionBuilder
    = AuthenticationTableCompanion Function({
  Value<int> id,
  required String firstName,
  required double latitude,
  required double longitude,
  required String address,
  required String verificationToken,
  required DateTime tokenExpiry,
  required bool isVerified,
  required String lastName,
  required String phoneNumber,
  required String picture,
  required String email,
  required String password,
  Value<DateTime> createdAt,
});
typedef $$AuthenticationTableTableUpdateCompanionBuilder
    = AuthenticationTableCompanion Function({
  Value<int> id,
  Value<String> firstName,
  Value<double> latitude,
  Value<double> longitude,
  Value<String> address,
  Value<String> verificationToken,
  Value<DateTime> tokenExpiry,
  Value<bool> isVerified,
  Value<String> lastName,
  Value<String> phoneNumber,
  Value<String> picture,
  Value<String> email,
  Value<String> password,
  Value<DateTime> createdAt,
});

class $$AuthenticationTableTableFilterComposer
    extends Composer<_$UserDatabase, $AuthenticationTableTable> {
  $$AuthenticationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get verificationToken => $composableBuilder(
      column: $table.verificationToken,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get tokenExpiry => $composableBuilder(
      column: $table.tokenExpiry, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get picture => $composableBuilder(
      column: $table.picture, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AuthenticationTableTableOrderingComposer
    extends Composer<_$UserDatabase, $AuthenticationTableTable> {
  $$AuthenticationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get verificationToken => $composableBuilder(
      column: $table.verificationToken,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get tokenExpiry => $composableBuilder(
      column: $table.tokenExpiry, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get picture => $composableBuilder(
      column: $table.picture, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AuthenticationTableTableAnnotationComposer
    extends Composer<_$UserDatabase, $AuthenticationTableTable> {
  $$AuthenticationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get verificationToken => $composableBuilder(
      column: $table.verificationToken, builder: (column) => column);

  GeneratedColumn<DateTime> get tokenExpiry => $composableBuilder(
      column: $table.tokenExpiry, builder: (column) => column);

  GeneratedColumn<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get picture =>
      $composableBuilder(column: $table.picture, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AuthenticationTableTableTableManager extends RootTableManager<
    _$UserDatabase,
    $AuthenticationTableTable,
    AuthenticationTableData,
    $$AuthenticationTableTableFilterComposer,
    $$AuthenticationTableTableOrderingComposer,
    $$AuthenticationTableTableAnnotationComposer,
    $$AuthenticationTableTableCreateCompanionBuilder,
    $$AuthenticationTableTableUpdateCompanionBuilder,
    (
      AuthenticationTableData,
      BaseReferences<_$UserDatabase, $AuthenticationTableTable,
          AuthenticationTableData>
    ),
    AuthenticationTableData,
    PrefetchHooks Function()> {
  $$AuthenticationTableTableTableManager(
      _$UserDatabase db, $AuthenticationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthenticationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthenticationTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthenticationTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> verificationToken = const Value.absent(),
            Value<DateTime> tokenExpiry = const Value.absent(),
            Value<bool> isVerified = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String> picture = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              AuthenticationTableCompanion(
            id: id,
            firstName: firstName,
            latitude: latitude,
            longitude: longitude,
            address: address,
            verificationToken: verificationToken,
            tokenExpiry: tokenExpiry,
            isVerified: isVerified,
            lastName: lastName,
            phoneNumber: phoneNumber,
            picture: picture,
            email: email,
            password: password,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firstName,
            required double latitude,
            required double longitude,
            required String address,
            required String verificationToken,
            required DateTime tokenExpiry,
            required bool isVerified,
            required String lastName,
            required String phoneNumber,
            required String picture,
            required String email,
            required String password,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              AuthenticationTableCompanion.insert(
            id: id,
            firstName: firstName,
            latitude: latitude,
            longitude: longitude,
            address: address,
            verificationToken: verificationToken,
            tokenExpiry: tokenExpiry,
            isVerified: isVerified,
            lastName: lastName,
            phoneNumber: phoneNumber,
            picture: picture,
            email: email,
            password: password,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuthenticationTableTableProcessedTableManager = ProcessedTableManager<
    _$UserDatabase,
    $AuthenticationTableTable,
    AuthenticationTableData,
    $$AuthenticationTableTableFilterComposer,
    $$AuthenticationTableTableOrderingComposer,
    $$AuthenticationTableTableAnnotationComposer,
    $$AuthenticationTableTableCreateCompanionBuilder,
    $$AuthenticationTableTableUpdateCompanionBuilder,
    (
      AuthenticationTableData,
      BaseReferences<_$UserDatabase, $AuthenticationTableTable,
          AuthenticationTableData>
    ),
    AuthenticationTableData,
    PrefetchHooks Function()>;

class $UserDatabaseManager {
  final _$UserDatabase _db;
  $UserDatabaseManager(this._db);
  $$AuthenticationTableTableTableManager get authenticationTable =>
      $$AuthenticationTableTableTableManager(_db, _db.authenticationTable);
}
