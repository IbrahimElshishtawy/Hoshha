class DateRange {
  const DateRange({required this.start, required this.end});

  final DateTime start;
  final DateTime end;

  bool get isValid => !end.isBefore(start);

  bool contains(DateTime value) {
    return !value.isBefore(start) && value.isBefore(end);
  }
}
