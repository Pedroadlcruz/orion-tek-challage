// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';

class ClientParams {
  final int company;
  final String name;

  const ClientParams({
    required this.name,
    required this.company,
  });

  ClientsCompanion toClientsCompanion() => ClientsCompanion(
        company: Value(company),
        name: Value(name),
      );

  ClientParams copyWith({
    int? company,
    String? name,
    String? profileImage,
  }) {
    return ClientParams(
      company: company ?? this.company,
      name: name ?? this.name,
    );
  }
}
