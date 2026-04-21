import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class BudgetStatusCard extends StatelessWidget {
  const BudgetStatusCard({
    super.key,
    required this.title,
    required this.statusLabel,
    required this.message,
    required this.progressLabel,
    required this.detailLabel,
    required this.progress,
    required this.icon,
    required this.accentColor,
  }) : _isLoading = false;

  const BudgetStatusCard.loading({super.key})
    : title = '',
      statusLabel = '',
      message = '',
      progressLabel = '',
      detailLabel = '',
      progress = 0,
      icon = Icons.wallet_rounded,
      accentColor = Colors.transparent,
      _isLoading = true;

  final String title;
  final String statusLabel;
  final String message;
  final String progressLabel;
  final String detailLabel;
  final double progress;
  final IconData icon;
  final Color accentColor;
  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final theme = Theme.of(context);
    final colors = context.appColors;

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: _isLoading
            ? const _BudgetStatusSkeleton()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: accentColor.withValues(alpha: 0.14),
                          borderRadius: BorderRadiusDirectional.circular(
                            context.appRadius.md,
                          ),
                        ),
                        child: Icon(icon, color: accentColor),
                      ),
                      SizedBox(width: spacing.sm),
                      Expanded(
                        child: Text(title, style: theme.textTheme.titleMedium),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: spacing.sm,
                          vertical: spacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: accentColor.withValues(alpha: 0.14),
                          borderRadius: BorderRadiusDirectional.circular(
                            context.appRadius.pill,
                          ),
                        ),
                        child: Text(
                          statusLabel,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: accentColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacing.md),
                  Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.72,
                      ),
                    ),
                  ),
                  SizedBox(height: spacing.md),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: progress.clamp(0, 1)),
                    duration: const Duration(milliseconds: 450),
                    curve: Curves.easeOutCubic,
                    builder: (context, animatedValue, _) {
                      return ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(
                          context.appRadius.pill,
                        ).resolve(Directionality.of(context)),
                        child: LinearProgressIndicator(
                          value: animatedValue,
                          minHeight: 10,
                          color: accentColor,
                          backgroundColor: colors.surfaceContainer,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: spacing.sm),
                  Text(
                    progressLabel,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: accentColor,
                    ),
                  ),
                  SizedBox(height: spacing.xs),
                  Text(
                    detailLabel,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.68,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _BudgetStatusSkeleton extends StatelessWidget {
  const _BudgetStatusSkeleton();

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: colors.surfaceContainer,
                borderRadius: BorderRadiusDirectional.circular(
                  context.appRadius.md,
                ),
              ),
            ),
            SizedBox(width: spacing.sm),
            const Expanded(child: _BudgetSkeletonLine(widthFactor: 0.32)),
            SizedBox(width: spacing.sm),
            const SizedBox(
              width: 84,
              child: _BudgetSkeletonLine(widthFactor: 1, height: 30),
            ),
          ],
        ),
        SizedBox(height: spacing.md),
        const _BudgetSkeletonLine(widthFactor: 0.88, height: 14),
        SizedBox(height: spacing.sm),
        const _BudgetSkeletonLine(widthFactor: 1, height: 10),
        SizedBox(height: spacing.sm),
        const _BudgetSkeletonLine(widthFactor: 0.52, height: 14),
        SizedBox(height: spacing.xs),
        const _BudgetSkeletonLine(widthFactor: 0.42, height: 14),
      ],
    );
  }
}

class _BudgetSkeletonLine extends StatelessWidget {
  const _BudgetSkeletonLine({required this.widthFactor, this.height = 16});

  final double widthFactor;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FractionallySizedBox(
      widthFactor: widthFactor,
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: colors.surfaceContainer,
          borderRadius: BorderRadiusDirectional.circular(context.appRadius.sm),
        ),
      ),
    );
  }
}
