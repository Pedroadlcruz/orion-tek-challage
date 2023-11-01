import 'package:dartz/dartz.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';

abstract class CompanyRepository {
  Future<Either<AppFailure, List<Company>>> loadCompanies();
  Future<Either<AppFailure, void>> createCompany(String name);
}
