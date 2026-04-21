import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class HomeEmptyStateBanner extends StatelessWidget {
  const HomeEmptyStateBanner({
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
    final theme = Theme.of(context);
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadiusDirectional.circular(
              context.appRadius.md,
            ),
          ),
          child: Icon(icon, color: colors.primary),
        ),
        SizedBox(height: spacing.md),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: spacing.xs),
        Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
          ),
          textAlign: TextAlign.start,
        ),
        if (actionLabel != null && onActionPressed != null) ...[
          SizedBox(height: spacing.md),
          FilledButton.tonal(
            onPressed: onActionPressed,
            child: Text(actionLabel!),
          ),
        ],
      ],
    );
  }
}
