enum SortDirection { ascending, descending }

class SortOption<TField> {
  const SortOption({
    required this.field,
    this.direction = SortDirection.descending,
  });

  final TField field;
  final SortDirection direction;
}
