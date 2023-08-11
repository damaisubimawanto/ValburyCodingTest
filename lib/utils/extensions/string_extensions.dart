extension StringExtensions on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    }
    return this!;
  }
}