import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class InsightsEmptyState extends StatelessWidget {
  const InsightsEmptyState({
    super.key,
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onActionPressed,
  });

  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: colors.surfaceContainer,
                borderRadius: BorderRadiusDirectional.circular(
                  context.appRadius.lg,
                ),
              ),
              child: Icon(
                Icons.insights_rounded,
                color: colors.primary,
                size: 32,
              ),
            ),
            SizedBox(height: spacing.lg),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: spacing.sm),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.74),
              ),
            ),
            SizedBox(height: spacing.lg),
            FilledButton.icon(
              onPressed: onActionPressed,
              icon: const Icon(Icons.add_rounded),
              label: Text(actionLabel),
            ),
          ],
        ),
      ),
    );
  }
}
