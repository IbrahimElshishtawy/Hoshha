import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import '../../../expenses/presentation/controllers/add_expense_controller.dart';

class HistoryCategoryFilter extends StatelessWidget {
  const HistoryCategoryFilter({
    super.key,
    required this.options,
    required this.selectedCategoryId,
    required this.onSelected,
  });

  final List<ExpenseCategoryOption> options;
  final String? selectedCategoryId;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('التصنيف', style: theme.textTheme.titleSmall),
        SizedBox(height: spacing.sm),
        Wrap(
          spacing: spacing.sm,
          runSpacing: spacing.sm,
          children: [
            ChoiceChip(
              label: const Text('الكل'),
              selected: selectedCategoryId == null,
              onSelected: (_) => onSelected(null),
            ),
            for (final option in options)
              ChoiceChip(
                label: Text(option.label),
                avatar: Icon(option.icon, size: 18),
                selected: option.id == selectedCategoryId,
                onSelected: (_) => onSelected(option.id),
                side: BorderSide(color: colors.outline),
                labelStyle: theme.textTheme.labelLarge?.copyWith(
                  color: option.id == selectedCategoryId
                      ? colors.primary
                      : theme.colorScheme.onSurface,
                ),
                selectedColor: colors.primary.withValues(alpha: 0.12),
              ),
          ],
        ),
      ],
    );
  }
}
