import 'package:get_it/get_it.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/app_database.dart';
import 'package:orion_tek_challenge/core/services/local_storage/database/tables/companies.dart';

///
/// Service Locator
///
GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //! Database
  final db = AppDatabase();
  sl.registerSingleton<AppDatabase>(
    db,
    dispose: (_) => db.close(),
  );
//! Tables
  sl.registerLazySingleton<CompaniesDao>(() => CompaniesDao(db));
}
