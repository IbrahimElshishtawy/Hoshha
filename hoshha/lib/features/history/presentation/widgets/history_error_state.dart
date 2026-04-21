import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class HistoryErrorState extends StatelessWidget {
  const HistoryErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

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
            Icon(Icons.error_outline_rounded, color: colors.error, size: 28),
            SizedBox(height: spacing.md),
            Text(
              'حدث خطأ أثناء تحميل السجل',
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
            SizedBox(height: spacing.md),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}
