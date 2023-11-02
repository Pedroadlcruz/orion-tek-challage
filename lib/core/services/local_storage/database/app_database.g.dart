// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CompaniesTable extends Companies
    with TableInfo<$CompaniesTable, Company> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompaniesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
      'logo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, logo, isActive, createdDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'companies';
  @override
  VerificationContext validateIntegrity(Insertable<Company> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Company map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Company(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      logo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
    );
  }

  @override
  $CompaniesTable createAlias(String alias) {
    return $CompaniesTable(attachedDatabase, alias);
  }
}

class Company extends DataClass implements Insertable<Company> {
  final int id;
  final String name;
  final String? logo;
  final bool isActive;
  final DateTime createdDate;
  const Company(
      {required this.id,
      required this.name,
      this.logo,
      required this.isActive,
      required this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<String>(logo);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  CompaniesCompanion toCompanion(bool nullToAbsent) {
    return CompaniesCompanion(
      id: Value(id),
      name: Value(name),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      isActive: Value(isActive),
      createdDate: Value(createdDate),
    );
  }

  factory Company.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Company(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      logo: serializer.fromJson<String?>(json['logo']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'logo': serializer.toJson<String?>(logo),
      'isActive': serializer.toJson<bool>(isActive),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  Company copyWith(
          {int? id,
          String? name,
          Value<String?> logo = const Value.absent(),
          bool? isActive,
          DateTime? createdDate}) =>
      Company(
        id: id ?? this.id,
        name: name ?? this.name,
        logo: logo.present ? logo.value : this.logo,
        isActive: isActive ?? this.isActive,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('Company(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logo: $logo, ')
          ..write('isActive: $isActive, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, logo, isActive, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Company &&
          other.id == this.id &&
          other.name == this.name &&
          other.logo == this.logo &&
          other.isActive == this.isActive &&
          other.createdDate == this.createdDate);
}

class CompaniesCompanion extends UpdateCompanion<Company> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> logo;
  final Value<bool> isActive;
  final Value<DateTime> createdDate;
  const CompaniesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.logo = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  CompaniesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.logo = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdDate = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Company> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? logo,
    Expression<bool>? isActive,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (logo != null) 'logo': logo,
      if (isActive != null) 'is_active': isActive,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  CompaniesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? logo,
      Value<bool>? isActive,
      Value<DateTime>? createdDate}) {
    return CompaniesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      isActive: isActive ?? this.isActive,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompaniesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logo: $logo, ')
          ..write('isActive: $isActive, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _companyMeta =
      const VerificationMeta('company');
  @override
  late final GeneratedColumn<int> company = GeneratedColumn<int>(
      'company', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES companies (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profilePictureMeta =
      const VerificationMeta('profilePicture');
  @override
  late final GeneratedColumn<String> profilePicture = GeneratedColumn<String>(
      'profile_picture', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, company, name, profilePicture, isActive, createdDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(Insertable<Client> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    } else if (isInserting) {
      context.missing(_companyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('profile_picture')) {
      context.handle(
          _profilePictureMeta,
          profilePicture.isAcceptableOrUnknown(
              data['profile_picture']!, _profilePictureMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}company'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      profilePicture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_picture']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final int id;
  final int company;
  final String name;
  final String? profilePicture;
  final bool isActive;
  final DateTime createdDate;
  const Client(
      {required this.id,
      required this.company,
      required this.name,
      this.profilePicture,
      required this.isActive,
      required this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company'] = Variable<int>(company);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || profilePicture != null) {
      map['profile_picture'] = Variable<String>(profilePicture);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      company: Value(company),
      name: Value(name),
      profilePicture: profilePicture == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePicture),
      isActive: Value(isActive),
      createdDate: Value(createdDate),
    );
  }

  factory Client.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<int>(json['id']),
      company: serializer.fromJson<int>(json['company']),
      name: serializer.fromJson<String>(json['name']),
      profilePicture: serializer.fromJson<String?>(json['profilePicture']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'company': serializer.toJson<int>(company),
      'name': serializer.toJson<String>(name),
      'profilePicture': serializer.toJson<String?>(profilePicture),
      'isActive': serializer.toJson<bool>(isActive),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  Client copyWith(
          {int? id,
          int? company,
          String? name,
          Value<String?> profilePicture = const Value.absent(),
          bool? isActive,
          DateTime? createdDate}) =>
      Client(
        id: id ?? this.id,
        company: company ?? this.company,
        name: name ?? this.name,
        profilePicture:
            profilePicture.present ? profilePicture.value : this.profilePicture,
        isActive: isActive ?? this.isActive,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('company: $company, ')
          ..write('name: $name, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('isActive: $isActive, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, company, name, profilePicture, isActive, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.company == this.company &&
          other.name == this.name &&
          other.profilePicture == this.profilePicture &&
          other.isActive == this.isActive &&
          other.createdDate == this.createdDate);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<int> company;
  final Value<String> name;
  final Value<String?> profilePicture;
  final Value<bool> isActive;
  final Value<DateTime> createdDate;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.company = const Value.absent(),
    this.name = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required int company,
    required String name,
    this.profilePicture = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdDate = const Value.absent(),
  })  : company = Value(company),
        name = Value(name);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<int>? company,
    Expression<String>? name,
    Expression<String>? profilePicture,
    Expression<bool>? isActive,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (company != null) 'company': company,
      if (name != null) 'name': name,
      if (profilePicture != null) 'profile_picture': profilePicture,
      if (isActive != null) 'is_active': isActive,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  ClientsCompanion copyWith(
      {Value<int>? id,
      Value<int>? company,
      Value<String>? name,
      Value<String?>? profilePicture,
      Value<bool>? isActive,
      Value<DateTime>? createdDate}) {
    return ClientsCompanion(
      id: id ?? this.id,
      company: company ?? this.company,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      isActive: isActive ?? this.isActive,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (company.present) {
      map['company'] = Variable<int>(company.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (profilePicture.present) {
      map['profile_picture'] = Variable<String>(profilePicture.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('company: $company, ')
          ..write('name: $name, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('isActive: $isActive, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $AddressesTable extends Addresses
    with TableInfo<$AddressesTable, Address> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientMeta = const VerificationMeta('client');
  @override
  late final GeneratedColumn<int> client = GeneratedColumn<int>(
      'client', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _provinceMeta =
      const VerificationMeta('province');
  @override
  late final GeneratedColumn<String> province = GeneratedColumn<String>(
      'province', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _buildingMeta =
      const VerificationMeta('building');
  @override
  late final GeneratedColumn<String> building = GeneratedColumn<String>(
      'building', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _apartmentMeta =
      const VerificationMeta('apartment');
  @override
  late final GeneratedColumn<String> apartment = GeneratedColumn<String>(
      'apartment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _municipalityMeta =
      const VerificationMeta('municipality');
  @override
  late final GeneratedColumn<String> municipality = GeneratedColumn<String>(
      'municipality', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        client,
        name,
        province,
        street,
        number,
        building,
        apartment,
        municipality,
        isActive,
        createdDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'addresses';
  @override
  VerificationContext validateIntegrity(Insertable<Address> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client')) {
      context.handle(_clientMeta,
          client.isAcceptableOrUnknown(data['client']!, _clientMeta));
    } else if (isInserting) {
      context.missing(_clientMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('province')) {
      context.handle(_provinceMeta,
          province.isAcceptableOrUnknown(data['province']!, _provinceMeta));
    } else if (isInserting) {
      context.missing(_provinceMeta);
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('building')) {
      context.handle(_buildingMeta,
          building.isAcceptableOrUnknown(data['building']!, _buildingMeta));
    }
    if (data.containsKey('apartment')) {
      context.handle(_apartmentMeta,
          apartment.isAcceptableOrUnknown(data['apartment']!, _apartmentMeta));
    }
    if (data.containsKey('municipality')) {
      context.handle(
          _municipalityMeta,
          municipality.isAcceptableOrUnknown(
              data['municipality']!, _municipalityMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Address map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Address(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      client: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      province: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}province'])!,
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      building: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}building']),
      apartment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}apartment']),
      municipality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}municipality']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
    );
  }

  @override
  $AddressesTable createAlias(String alias) {
    return $AddressesTable(attachedDatabase, alias);
  }
}

class Address extends DataClass implements Insertable<Address> {
  final int id;
  final int client;
  final String name;
  final String province;
  final String street;
  final String number;
  final String? building;
  final String? apartment;
  final String? municipality;
  final bool isActive;
  final DateTime createdDate;
  const Address(
      {required this.id,
      required this.client,
      required this.name,
      required this.province,
      required this.street,
      required this.number,
      this.building,
      this.apartment,
      this.municipality,
      required this.isActive,
      required this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client'] = Variable<int>(client);
    map['name'] = Variable<String>(name);
    map['province'] = Variable<String>(province);
    map['street'] = Variable<String>(street);
    map['number'] = Variable<String>(number);
    if (!nullToAbsent || building != null) {
      map['building'] = Variable<String>(building);
    }
    if (!nullToAbsent || apartment != null) {
      map['apartment'] = Variable<String>(apartment);
    }
    if (!nullToAbsent || municipality != null) {
      map['municipality'] = Variable<String>(municipality);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  AddressesCompanion toCompanion(bool nullToAbsent) {
    return AddressesCompanion(
      id: Value(id),
      client: Value(client),
      name: Value(name),
      province: Value(province),
      street: Value(street),
      number: Value(number),
      building: building == null && nullToAbsent
          ? const Value.absent()
          : Value(building),
      apartment: apartment == null && nullToAbsent
          ? const Value.absent()
          : Value(apartment),
      municipality: municipality == null && nullToAbsent
          ? const Value.absent()
          : Value(municipality),
      isActive: Value(isActive),
      createdDate: Value(createdDate),
    );
  }

  factory Address.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Address(
      id: serializer.fromJson<int>(json['id']),
      client: serializer.fromJson<int>(json['client']),
      name: serializer.fromJson<String>(json['name']),
      province: serializer.fromJson<String>(json['province']),
      street: serializer.fromJson<String>(json['street']),
      number: serializer.fromJson<String>(json['number']),
      building: serializer.fromJson<String?>(json['building']),
      apartment: serializer.fromJson<String?>(json['apartment']),
      municipality: serializer.fromJson<String?>(json['municipality']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'client': serializer.toJson<int>(client),
      'name': serializer.toJson<String>(name),
      'province': serializer.toJson<String>(province),
      'street': serializer.toJson<String>(street),
      'number': serializer.toJson<String>(number),
      'building': serializer.toJson<String?>(building),
      'apartment': serializer.toJson<String?>(apartment),
      'municipality': serializer.toJson<String?>(municipality),
      'isActive': serializer.toJson<bool>(isActive),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  Address copyWith(
          {int? id,
          int? client,
          String? name,
          String? province,
          String? street,
          String? number,
          Value<String?> building = const Value.absent(),
          Value<String?> apartment = const Value.absent(),
          Value<String?> municipality = const Value.absent(),
          bool? isActive,
          DateTime? createdDate}) =>
      Address(
        id: id ?? this.id,
        client: client ?? this.client,
        name: name ?? this.name,
        province: province ?? this.province,
        street: street ?? this.street,
        number: number ?? this.number,
        building: building.present ? building.value : this.building,
        apartment: apartment.present ? apartment.value : this.apartment,
        municipality:
            municipality.present ? municipality.value : this.municipality,
        isActive: isActive ?? this.isActive,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('Address(')
          ..write('id: $id, ')
          ..write('client: $client, ')
          ..write('name: $name, ')
          ..write('province: $province, ')
          ..write('street: $street, ')
          ..write('number: $number, ')
          ..write('building: $building, ')
          ..write('apartment: $apartment, ')
          ..write('municipality: $municipality, ')
          ..write('isActive: $isActive, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, client, name, province, street, number,
      building, apartment, municipality, isActive, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Address &&
          other.id == this.id &&
          other.client == this.client &&
          other.name == this.name &&
          other.province == this.province &&
          other.street == this.street &&
          other.number == this.number &&
          other.building == this.building &&
          other.apartment == this.apartment &&
          other.municipality == this.municipality &&
          other.isActive == this.isActive &&
          other.createdDate == this.createdDate);
}

class AddressesCompanion extends UpdateCompanion<Address> {
  final Value<int> id;
  final Value<int> client;
  final Value<String> name;
  final Value<String> province;
  final Value<String> street;
  final Value<String> number;
  final Value<String?> building;
  final Value<String?> apartment;
  final Value<String?> municipality;
  final Value<bool> isActive;
  final Value<DateTime> createdDate;
  const AddressesCompanion({
    this.id = const Value.absent(),
    this.client = const Value.absent(),
    this.name = const Value.absent(),
    this.province = const Value.absent(),
    this.street = const Value.absent(),
    this.number = const Value.absent(),
    this.building = const Value.absent(),
    this.apartment = const Value.absent(),
    this.municipality = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  AddressesCompanion.insert({
    this.id = const Value.absent(),
    required int client,
    required String name,
    required String province,
    required String street,
    required String number,
    this.building = const Value.absent(),
    this.apartment = const Value.absent(),
    this.municipality = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdDate = const Value.absent(),
  })  : client = Value(client),
        name = Value(name),
        province = Value(province),
        street = Value(street),
        number = Value(number);
  static Insertable<Address> custom({
    Expression<int>? id,
    Expression<int>? client,
    Expression<String>? name,
    Expression<String>? province,
    Expression<String>? street,
    Expression<String>? number,
    Expression<String>? building,
    Expression<String>? apartment,
    Expression<String>? municipality,
    Expression<bool>? isActive,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (client != null) 'client': client,
      if (name != null) 'name': name,
      if (province != null) 'province': province,
      if (street != null) 'street': street,
      if (number != null) 'number': number,
      if (building != null) 'building': building,
      if (apartment != null) 'apartment': apartment,
      if (municipality != null) 'municipality': municipality,
      if (isActive != null) 'is_active': isActive,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  AddressesCompanion copyWith(
      {Value<int>? id,
      Value<int>? client,
      Value<String>? name,
      Value<String>? province,
      Value<String>? street,
      Value<String>? number,
      Value<String?>? building,
      Value<String?>? apartment,
      Value<String?>? municipality,
      Value<bool>? isActive,
      Value<DateTime>? createdDate}) {
    return AddressesCompanion(
      id: id ?? this.id,
      client: client ?? this.client,
      name: name ?? this.name,
      province: province ?? this.province,
      street: street ?? this.street,
      number: number ?? this.number,
      building: building ?? this.building,
      apartment: apartment ?? this.apartment,
      municipality: municipality ?? this.municipality,
      isActive: isActive ?? this.isActive,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (client.present) {
      map['client'] = Variable<int>(client.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (province.present) {
      map['province'] = Variable<String>(province.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (building.present) {
      map['building'] = Variable<String>(building.value);
    }
    if (apartment.present) {
      map['apartment'] = Variable<String>(apartment.value);
    }
    if (municipality.present) {
      map['municipality'] = Variable<String>(municipality.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddressesCompanion(')
          ..write('id: $id, ')
          ..write('client: $client, ')
          ..write('name: $name, ')
          ..write('province: $province, ')
          ..write('street: $street, ')
          ..write('number: $number, ')
          ..write('building: $building, ')
          ..write('apartment: $apartment, ')
          ..write('municipality: $municipality, ')
          ..write('isActive: $isActive, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CompaniesTable companies = $CompaniesTable(this);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $AddressesTable addresses = $AddressesTable(this);
  late final CompaniesDao companiesDao = CompaniesDao(this as AppDatabase);
  late final ClientsDao clientsDao = ClientsDao(this as AppDatabase);
  late final AddressesDao addressesDao = AddressesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [companies, clients, addresses];
}
