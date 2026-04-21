import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class TopCategoryCard extends StatelessWidget {
  const TopCategoryCard({
    super.key,
    required this.title,
    required this.categoryLabel,
    required this.subtitle,
    required this.icon,
  }) : _isLoading = false;

  const TopCategoryCard.loading({super.key})
    : title = '',
      categoryLabel = '',
      subtitle = '',
      icon = Icons.category_rounded,
      _isLoading = true;

  final String title;
  final String categoryLabel;
  final String subtitle;
  final IconData icon;
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
            ? const _TopCategorySkeleton()
            : Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: colors.secondary.withValues(alpha: 0.16),
                      borderRadius: BorderRadiusDirectional.circular(
                        context.appRadius.lg,
                      ),
                    ),
                    child: Icon(icon, color: colors.secondary),
                  ),
                  SizedBox(width: spacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: theme.textTheme.titleMedium),
                        SizedBox(height: spacing.sm),
                        Text(
                          categoryLabel,
                          style: theme.textTheme.headlineMedium,
                        ),
                        SizedBox(height: spacing.xs),
                        Text(
                          subtitle,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.72,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _TopCategorySkeleton extends StatelessWidget {
  const _TopCategorySkeleton();

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Row(
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
        ),
        SizedBox(width: spacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SkeletonLine(widthFactor: 0.28),
              SizedBox(height: spacing.sm),
              _SkeletonLine(widthFactor: 0.54, height: 26),
              SizedBox(height: spacing.xs),
              _SkeletonLine(widthFactor: 0.7, height: 14),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({required this.widthFactor, this.height = 16});

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
