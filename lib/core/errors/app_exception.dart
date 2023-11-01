import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orion_tek_challenge/core/errors/app_failure.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  //Local Storage
  const factory AppException.cache() = CacheException;

  // Common
  const factory AppException.unexpected() = UnexpectedException;
}

extension AppExceptionDetails on AppException {
  AppFailure get toAppFailure {
    return maybeWhen(
      orElse: () => const AppFailure.unexpected(),
      cache: () => const AppFailure.cache(),
    );
  }
}
