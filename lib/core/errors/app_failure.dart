import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/strings.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure implements Exception {
  // Common
  const factory AppFailure.cache() = CacheFailure;
  const factory AppFailure.unexpected() = UnexpectedFailure;
}

extension AppExceptionMessages on AppFailure {
  String get message {
    return maybeWhen(
      orElse: () => Strings.unexpectedFailure,
      cache: () => Strings.unexpectedFailure,
    );
  }
}
