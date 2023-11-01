import 'package:dartz/dartz.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';
import 'package:orion_tek_challenge/data/models/company_model.dart';

abstract class CompanyRepository {
  Future<Either<AppFailure, List<CompanyModel>>> loadCompanies();
  Future<Either<AppFailure, CompanyModel>> createCompany(String name);
  Future<Either<AppFailure, void>> updateCompany(CompanyModel company);
  Future<Either<AppFailure, void>> deleteCompany(String id);
}
