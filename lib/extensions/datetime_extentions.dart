extension DateTimeExtensions on DateTime? {
  String toNamedString() {
    return "${this!.year}-${this!.month}-${this!.day}";
  }
}
