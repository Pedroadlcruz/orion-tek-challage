import 'package:orion_tek_challenge/core/services/local_storage/cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCacheManager implements CacheManager {
  final SharedPreferences sharedPreferences;

  SharedPreferencesCacheManager(this.sharedPreferences);

  @override
  Future<void> deleteAllValues() {
    // TODO: implement deleteAllValues
    throw UnimplementedError();
  }

  @override
  Future<void> deleteValue({required String key}) {
    // TODO: implement deleteValue
    throw UnimplementedError();
  }

  @override
  Future<bool> existValue({required String key}) {
    // TODO: implement existValue
    throw UnimplementedError();
  }

  @override
  Future<String?> getValue({required String key}) {
    // TODO: implement getValue
    throw UnimplementedError();
  }

  @override
  Future<void> saveValue({required String key, required String value}) {
    // TODO: implement saveValue
    throw UnimplementedError();
  }
}
