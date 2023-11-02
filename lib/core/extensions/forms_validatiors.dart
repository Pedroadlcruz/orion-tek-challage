import 'package:orion_tek_challenge/core/constants/strings.dart';

extension FormValidatorsExt on String {
  /// Returns [null] if given string [isNotEmpty] and
  /// [length] is greater than or equal to [2]
  String? get isNameValid {
    if (isEmpty) {
      return Strings.emptyNameValidationMessage;
    }
    if (length <= 2) {
      return Strings.validNameValidationMessage;
    } else if (length >= 20) {
      return Strings.tooLargeNameValidationMessage;
    } else {
      return null;
    }
  }
}
