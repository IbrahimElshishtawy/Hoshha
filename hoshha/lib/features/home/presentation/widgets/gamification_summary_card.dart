import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class GamificationSummaryCard extends StatelessWidget {
  const GamificationSummaryCard({
    super.key,
    required this.title,
    required this.xpValue,
    required this.xpLabel,
    required this.levelLabel,
    required this.streakLabel,
    required this.progress,
    required this.progressLabel,
    required this.message,
  });

  final String title;
  final String xpValue;
  final String xpLabel;
  final String levelLabel;
  final String streakLabel;
  final double progress;
  final String progressLabel;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final radius = BorderRadiusDirectional.circular(
      context.appRadius.pill,
    ).resolve(Directionality.of(context));

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            SizedBox(height: spacing.md),
            Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.all(spacing.md),
              decoration: BoxDecoration(
                color: colors.surfaceContainer,
                borderRadius: BorderRadiusDirectional.circular(
                  context.appRadius.md,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    xpValue,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: colors.primary,
                    ),
                  ),
                  SizedBox(height: spacing.xs),
                  Text(
                    xpLabel,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing.md),
            Wrap(
              spacing: spacing.sm,
              runSpacing: spacing.sm,
              children: [
                _InfoChip(
                  icon: Icons.workspace_premium_outlined,
                  label: levelLabel,
                ),
                _InfoChip(
                  icon: Icons.local_fire_department_outlined,
                  label: streakLabel,
                ),
              ],
            ),
            SizedBox(height: spacing.md),
            ClipRRect(
              borderRadius: radius,
              child: LinearProgressIndicator(
                value: math.max(0, math.min(progress, 1)),
                minHeight: 10,
                color: colors.secondary,
                backgroundColor: colors.surfaceContainer,
              ),
            ),
            SizedBox(height: spacing.sm),
            Text(
              progressLabel,
              style: theme.textTheme.labelLarge?.copyWith(
                color: colors.primary,
              ),
            ),
            SizedBox(height: spacing.sm),
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: spacing.md,
        vertical: spacing.sm,
      ),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadiusDirectional.circular(context.appRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: colors.primary),
          SizedBox(width: spacing.xs),
          Text(label, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
