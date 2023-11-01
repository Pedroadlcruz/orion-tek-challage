abstract class CacheManager {
  /// Gets a [String] which was cached with the given [key] or null
  /// if [key] is not in the storage.
  ///
  /// Throws [CacheException] if sometime get wrong.
  Future<String?> getValue({required String key});

  /// Cache a [String]  with the given [key]
  ///
  /// Throws [CacheException] if sometime get wrong.
  Future<void> saveValue({required String key, required String value});

  /// Remove the cached [value] which was saved with the current [key]
  ///
  /// Throws [CacheException] if sometime get wrong.
  Future<void> deleteValue({required String key});

  /// Remove all  cached values.
  ///
  /// Throws [CacheException] if sometime get wrong.
  Future<void> deleteAllValues();

  /// Returns true if persistent storage the contains the given [key].
  ///
  /// Throws [CacheException] if sometime get wrong.
  Future<bool> existValue({required String key});
}
