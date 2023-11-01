import 'package:drift/drift.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/clients.dart';

part 'addresses.g.dart';

@DataClassName('Address')
class Addresses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get client => integer().references(Clients, #id)();
  TextColumn get name => text()();
  TextColumn get province => text()();
  TextColumn get street => text()();
  TextColumn get number => text()();
  TextColumn get building => text().nullable()();
  TextColumn get apartment => text().nullable()();
  TextColumn get municipality => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdDate =>
      dateTime().withDefault(currentDateAndTime)();
}

@DriftAccessor(tables: [Addresses])
class AddressesDao extends DatabaseAccessor<AppDatabase>
    with _$AddressesDaoMixin {
  final AppDatabase db;
  AddressesDao(this.db) : super(db);

  Future<List<Address>> getClientAddresses(int clientId) async =>
      (select(addresses)..where((address) => address.client.equals(clientId)))
          .get();
  Future<int> insertAddress(Insertable<Address> address) async =>
      into(addresses).insert(address);
}
