import 'package:drift/drift.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';

part 'companies.g.dart';

@DataClassName('Company')
class Companies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get logo => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdDate =>
      dateTime().withDefault(currentDateAndTime)();
}

@DriftAccessor(tables: [Companies])
class CompaniesDao extends DatabaseAccessor<AppDatabase>
    with _$CompaniesDaoMixin {
  final AppDatabase db;
  CompaniesDao(this.db) : super(db);

  Future<List<Company>> getCompanies() async =>
      (select(companies)..where((company) => company.isActive.equals(true)))
          .get();
  Future<int> insertCompany(Insertable<Company> company) async =>
      into(companies).insert(company);
  Future<void> deleteCompany(int id) async =>
      (update(companies)..where((company) => company.id.equals(id)))
          .write(const CompaniesCompanion(isActive: Value(false)));
}
