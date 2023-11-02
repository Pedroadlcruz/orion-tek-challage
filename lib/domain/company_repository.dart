import 'package:dartz/dartz.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/data/models/address_params.dart';
import 'package:orion_tek_challenge/data/models/client_params.dart';

abstract class CompanyRepository {
  Future<Either<AppFailure, List<Company>>> loadCompanies();
  Future<Either<AppFailure, void>> createCompany(String name);
  Future<Either<AppFailure, List<Company>>> deleteCompany(int id);
  Future<Either<AppFailure, Client>> createClient(ClientParams params);
  Future<Either<AppFailure, List<Client>>> getCompanyClients(int companyId);
  Future<Either<AppFailure, void>> createAddress(AddressParams params);
  Future<Either<AppFailure, List<Address>>> getClientsAddresses(int clienteId);
}
