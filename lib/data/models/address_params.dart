import 'package:drift/drift.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';

class AddressParams {
  final int client;
  final String name;
  final String province;
  final String street;
  final String number;

  const AddressParams({
    required this.province,
    required this.street,
    required this.number,
    required this.client,
    required this.name,
  });

  AddressesCompanion toAddressesCompanion(int clientId) => AddressesCompanion(
        client: Value(clientId),
        name: Value(name),
        province: Value(province),
        street: Value(street),
        number: Value(number),
      );
}
