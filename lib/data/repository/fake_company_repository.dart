import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/addresses.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/clients.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/companies.dart';
import 'package:orion_tek_challenge/data/models/address_params.dart';
import 'package:orion_tek_challenge/data/models/client_params.dart';

import '../../domain/company_repository.dart';

class FakeCompaniesRepository implements CompanyRepository {
  final CompaniesDao companiesDao;
  final ClientsDao clientsDao;
  final AddressesDao addressesDao;
  FakeCompaniesRepository({
    required this.companiesDao,
    required this.clientsDao,
    required this.addressesDao,
  });
  @override
  Future<Either<AppFailure, void>> createCompany(String name) async {
    try {
      //Just for simulate a server call
      await Future.delayed(const Duration(milliseconds: 200));
      await companiesDao.insertCompany(CompaniesCompanion(
        name: Value(name),
      ));

      // ignore: void_checks
      return const Right(Void);
    } on DriftRemoteException catch (_) {
      return const Left(AppFailure.nameDuplication());
    } on Exception catch (_) {
      return const Left(AppFailure.unexpected());
    }
  }

  @override
  Future<Either<AppFailure, List<Company>>> loadCompanies() async {
    try {
      //Just for simulate a server call
      await Future.delayed(const Duration(milliseconds: 200));
      final companies = await companiesDao.getCompanies();
      return Right(companies);
    } on Exception {
      return const Left(AppFailure.unexpected());
    }
  }

  @override
  Future<Either<AppFailure, Client>> createClient(ClientParams params) async {
    try {
      //Just for simulate a server call
      await Future.delayed(const Duration(milliseconds: 200));
      final clientId =
          await clientsDao.insertClient(params.toClientsCompanion());
      final client = await clientsDao.getClientById(clientId);
      return Right(client);
    } on Exception {
      return const Left(AppFailure.unexpected());
    }
  }

  @override
  Future<Either<AppFailure, void>> createAddress(AddressParams params) async {
    try {
      //Just for simulate a server call
      await Future.delayed(const Duration(milliseconds: 200));
      await addressesDao
          .insertAddress(params.toAddressesCompanion(params.client));

      // ignore: void_checks
      return const Right(Void);
    } on Exception {
      return const Left(AppFailure.unexpected());
    }
  }

  @override
  Future<Either<AppFailure, List<Address>>> getClientsAddresses(
      int clienteId) async {
    try {
      //Just for simulate a server call
      await Future.delayed(const Duration(milliseconds: 200));
      final addresses = await addressesDao.getClientAddresses(clienteId);
      return Right(addresses);
    } on Exception {
      return const Left(AppFailure.unexpected());
    }
  }

  @override
  Future<Either<AppFailure, List<Client>>> getCompanyClients(
      int companyId) async {
    try {
      //Just for simulate a server call
      await Future.delayed(const Duration(milliseconds: 200));
      final clients = await clientsDao.getCompanyClients(companyId);
      return Right(clients);
    } on Exception {
      return const Left(AppFailure.unexpected());
    }
  }
}
