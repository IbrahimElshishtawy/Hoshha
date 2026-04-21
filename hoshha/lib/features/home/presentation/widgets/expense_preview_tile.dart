import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class ExpensePreviewTile extends StatelessWidget {
  const ExpensePreviewTile({
    super.key,
    required this.amountText,
    required this.categoryText,
    required this.dateText,
    this.noteText,
  });

  final String amountText;
  final String categoryText;
  final String dateText;
  final String? noteText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: spacing.md,
        vertical: spacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.surfaceContainer,
              borderRadius: BorderRadiusDirectional.circular(
                context.appRadius.md,
              ),
            ),
            child: Icon(
              Icons.receipt_long_outlined,
              color: colors.primary,
              size: 20,
            ),
          ),
          SizedBox(width: spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryText,
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
                SizedBox(height: spacing.xs),
                Text(
                  dateText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                if (noteText != null) ...[
                  SizedBox(height: spacing.xs),
                  Text(
                    noteText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: spacing.sm),
          Text(
            amountText,
            style: theme.textTheme.titleMedium?.copyWith(color: colors.primary),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
