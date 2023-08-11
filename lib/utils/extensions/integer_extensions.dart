extension IntegerExtensions on int? {
  int orZero() {
    if (this == null) {
      return 0;
    }
    return this!;
  }
}