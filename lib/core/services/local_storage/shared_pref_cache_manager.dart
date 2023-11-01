import 'package:orion_tek_challenge/core/services/local_storage/cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../errors/app_exception.dart';

class SharedPreferencesCacheManager implements CacheManager {
  final SharedPreferences sharedPreferences;

  SharedPreferencesCacheManager(this.sharedPreferences);

  @override
  Future<void> deleteAllValues() async {
    final whereDeleted = await sharedPreferences.clear();
    if (whereDeleted) return;
    throw const AppException.cache();
  }

  @override
  Future<void> deleteValue({required String key}) async {
    final wasRemoved = await sharedPreferences.remove(key);
    if (wasRemoved) return;
    throw const AppException.cache();
  }

  @override
  Future<bool> existValue({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<String?> getValue({required String key}) async {
    try {
      final result = sharedPreferences.getString(key);
      return Future.value(result);
    } catch (_) {
      throw const AppException.cache();
    }
  }

  @override
  Future<void> saveValue({required String key, required String value}) async {
    final wasSaved = await sharedPreferences.setString(key, value);
    if (wasSaved) return;
    throw const AppException.cache();
  }
}
