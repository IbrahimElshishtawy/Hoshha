String monthKeyFromDate(DateTime date) {
  final normalized = DateTime(date.year, date.month);
  final month = normalized.month.toString().padLeft(2, '0');
  return '${normalized.year}-$month';
}

DateTime monthStartFromKey(String monthKey) {
  final parts = monthKey.split('-');
  if (parts.length != 2) {
    throw FormatException('Invalid month key: $monthKey');
  }

  final year = int.parse(parts[0]);
  final month = int.parse(parts[1]);
  return DateTime(year, month);
}
