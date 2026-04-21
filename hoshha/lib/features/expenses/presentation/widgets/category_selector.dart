import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import '../controllers/add_expense_controller.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.options,
    required this.onSelected,
    this.selectedCategoryId,
    this.errorText,
    this.enabled = true,
  });

  final List<ExpenseCategoryOption> options;
  final ValueChanged<String> onSelected;
  final String? selectedCategoryId;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الفئة', style: theme.textTheme.titleSmall),
        SizedBox(height: spacing.md),
        Wrap(
          spacing: spacing.sm,
          runSpacing: spacing.sm,
          children: [
            for (final option in options)
              ChoiceChip(
                label: Text(option.label),
                avatar: Icon(option.icon, size: 18),
                selected: option.id == selectedCategoryId,
                onSelected: enabled ? (_) => onSelected(option.id) : null,
                selectedColor: colors.primary.withValues(alpha: 0.14),
                side: BorderSide(color: colors.outline),
                labelStyle: theme.textTheme.labelLarge?.copyWith(
                  color: option.id == selectedCategoryId
                      ? colors.primary
                      : theme.colorScheme.onSurface,
                ),
              ),
          ],
        ),
        if (errorText != null) ...[
          SizedBox(height: spacing.sm),
          Text(
            errorText!,
            style: theme.textTheme.bodySmall?.copyWith(color: colors.error),
          ),
        ],
      ],
    );
  }
}
