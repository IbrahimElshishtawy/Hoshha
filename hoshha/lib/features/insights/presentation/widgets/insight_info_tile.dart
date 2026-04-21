import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class InsightInfoTile extends StatelessWidget {
  const InsightInfoTile({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
  });

  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Container(
      padding: EdgeInsetsDirectional.all(spacing.md),
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: BorderRadiusDirectional.circular(context.appRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadiusDirectional.circular(
                  context.appRadius.sm,
                ),
              ),
              child: Icon(icon, color: colors.primary, size: 20),
            ),
            SizedBox(height: spacing.sm),
          ],
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
            ),
          ),
          SizedBox(height: spacing.sm),
          Text(value, style: theme.textTheme.titleLarge),
          if (subtitle != null) ...[
            SizedBox(height: spacing.xs),
            Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.66),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
