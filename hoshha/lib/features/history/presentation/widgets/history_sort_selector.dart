import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import '../../../expenses/application/models/expense_sort_option.dart';

class HistorySortSelector extends StatelessWidget {
  const HistorySortSelector({
    super.key,
    required this.selectedSort,
    required this.onSelected,
  });

  final ExpenseSortOption selectedSort;
  final ValueChanged<ExpenseSortOption> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = BorderRadiusDirectional.circular(
      context.appRadius.md,
    ).resolve(Directionality.of(context));
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الترتيب', style: theme.textTheme.titleSmall),
        SizedBox(height: spacing.sm),
        PopupMenuButton<ExpenseSortOption>(
          initialValue: selectedSort,
          onSelected: onSelected,
          itemBuilder: (context) => ExpenseSortOption.values
              .map(
                (option) => PopupMenuItem<ExpenseSortOption>(
                  value: option,
                  child: Text(_labelFor(option)),
                ),
              )
              .toList(growable: false),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: colors.outline),
              borderRadius: BorderRadius.all(radius.topLeft),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: spacing.md,
                vertical: spacing.sm + spacing.xs,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.swap_vert_rounded),
                  SizedBox(width: spacing.sm),
                  Text(
                    _labelFor(selectedSort),
                    style: theme.textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _labelFor(ExpenseSortOption option) {
    return switch (option) {
      ExpenseSortOption.latest => 'الأحدث',
      ExpenseSortOption.oldest => 'الأقدم',
      ExpenseSortOption.highest => 'الأعلى',
      ExpenseSortOption.lowest => 'الأقل',
    };
  }
}
