// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/data/models/address_params.dart';

class ClientParams {
  final int company;
  final String name;
  final String? profileImage;
  final List<AddressParams> addresses;
  const ClientParams({
    required this.name,
    required this.company,
    required this.addresses,
    this.profileImage,
  });

  ClientsCompanion toClientsCompanion() => ClientsCompanion(
        company: Value(company),
        name: Value(name),
        profilePicture: Value.ofNullable(profileImage),
      );

  ClientParams copyWith({
    int? company,
    String? name,
    String? profileImage,
    List<AddressParams>? addresses,
  }) {
    return ClientParams(
      company: company ?? this.company,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      addresses: addresses ?? this.addresses,
    );
  }
}
