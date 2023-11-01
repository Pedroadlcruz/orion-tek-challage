extension StringsFormattersExt on String {
  String get normalizeName {
    if (isEmpty) {
      return this;
    }
    final normalizedWords = split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return word;
    }).toList();
    final normalizedName = normalizedWords.join(' ');

    return normalizedName;
  }
}
