import 'package:drift/drift.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/companies.dart';

part 'clients.g.dart';

class Clients extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get company => integer().references(Companies, #id)();
  TextColumn get name => text()();
  TextColumn get profilePicture => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdDate =>
      dateTime().withDefault(currentDateAndTime)();
}

@DriftAccessor(tables: [Clients])
class ClientsDao extends DatabaseAccessor<AppDatabase> with _$ClientsDaoMixin {
  final AppDatabase db;
  ClientsDao(this.db) : super(db);

  Future<List<Client>> getCompanyClients(int companyId) async =>
      (select(clients)..where((client) => client.company.equals(companyId)))
          .get();
  Future<int> insertClient(Insertable<Client> client) async =>
      into(clients).insert(client);

  Future<Client> getClientById(int id) async =>
      (select(clients)..where((client) => client.id.equals(id))).getSingle();
}
