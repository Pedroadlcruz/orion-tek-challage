import 'package:uuid/uuid.dart';

class GuidUtil {
  const GuidUtil();

  static String generateUUID() {
    return const Uuid().v4();
  }
}
