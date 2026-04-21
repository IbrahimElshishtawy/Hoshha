import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onActionPressed,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: colors.surfaceContainer,
                borderRadius: BorderRadiusDirectional.circular(
                  context.appRadius.lg,
                ),
              ),
              child: Icon(icon, color: colors.primary),
            ),
            SizedBox(height: spacing.md),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: spacing.sm),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.78),
              ),
            ),
            if (actionLabel != null && onActionPressed != null) ...[
              SizedBox(height: spacing.md),
              TextButton(onPressed: onActionPressed, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}
