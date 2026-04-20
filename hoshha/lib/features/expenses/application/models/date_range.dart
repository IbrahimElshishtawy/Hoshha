class DateRange {
  const DateRange({required this.start, required this.end});

  factory DateRange.month(DateTime month) {
    final normalizedMonth = DateTime(month.year, month.month);
    return DateRange(
      start: normalizedMonth,
      end: DateTime(normalizedMonth.year, normalizedMonth.month + 1),
    );
  }

  final DateTime start;
  final DateTime end;

  bool get isValid => !end.isBefore(start);

  DateRange get normalized =>
      isValid ? this : DateRange(start: end, end: start);

  bool contains(DateTime value) {
    final range = normalized;
    return !value.isBefore(range.start) && value.isBefore(range.end);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DateRange && other.start == start && other.end == end;
  }

  @override
  int get hashCode => Object.hash(start, end);
}
