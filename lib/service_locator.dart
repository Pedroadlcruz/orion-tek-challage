import 'package:get_it/get_it.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/companies.dart';
import 'package:orion_tek_challenge/data/repository/fake_company_repository.dart';
import 'package:orion_tek_challenge/domain/company_repository.dart';
import 'package:orion_tek_challenge/presentation/blocs/home_bloc/home_bloc.dart';

///
/// Service Locator
///
GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // //!Blocs
  sl.registerFactory(() => HomeBloc(companiesRepository: sl()));

  //! Repositories

  sl.registerLazySingleton<CompanyRepository>(
    () => FakeCompaniesRepository(companiesDao: sl()),
  );

  //! Database
  final db = AppDatabase();
  sl.registerSingleton<AppDatabase>(
    db,
    dispose: (_) => db.close(),
  );
//! Tables
  sl.registerLazySingleton<CompaniesDao>(() => CompaniesDao(db));
}
