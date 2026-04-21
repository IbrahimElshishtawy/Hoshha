import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class ExpenseHistoryTile extends StatelessWidget {
  const ExpenseHistoryTile({
    super.key,
    required this.amountText,
    required this.categoryText,
    required this.timeText,
    required this.icon,
    this.noteText,
  });

  final String amountText;
  final String categoryText;
  final String timeText;
  final IconData icon;
  final String? noteText;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final theme = Theme.of(context);

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
            child: Icon(icon, color: colors.primary, size: 20),
          ),
          SizedBox(width: spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(categoryText, style: theme.textTheme.titleMedium),
                SizedBox(height: spacing.xs),
                Text(
                  timeText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
                  ),
                ),
                if (noteText != null) ...[
                  SizedBox(height: spacing.xs),
                  Text(
                    noteText!,
                    maxLines: 2,
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
