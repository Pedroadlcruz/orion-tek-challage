import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/companies.dart';

import '../../domain/company_repository.dart';

class FakeCompaniesRepository implements CompanyRepository {
  final CompaniesDao companiesDao;

  FakeCompaniesRepository({required this.companiesDao});
  @override
  Future<Either<AppFailure, void>> createCompany(String name) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      final resp = await companiesDao.insertCompany(CompaniesCompanion(
        name: Value(name),
      ));
      print(resp);
      // ignore: void_checks
      return const Right(Void);
    } on Exception {
      return const Left(AppFailure.unexpected());
    }
  }

  @override
  Future<Either<AppFailure, List<Company>>> loadCompanies() async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      final resp = await companiesDao.getCompanies();
      print(resp);
      return Right(resp);
    } on Exception {
      return const Left(AppFailure.unexpected());
    }
  }
}
