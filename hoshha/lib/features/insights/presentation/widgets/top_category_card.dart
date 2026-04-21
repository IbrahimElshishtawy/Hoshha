import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class TopCategoryCard extends StatelessWidget {
  const TopCategoryCard({
    super.key,
    required this.title,
    required this.categoryLabel,
    required this.amountLabel,
    required this.subtitle,
    required this.icon,
    this.supportingLabel,
  }) : _isLoading = false,
       _isEmpty = false,
       _emptyMessage = null;

  const TopCategoryCard.loading({super.key})
    : title = '',
      categoryLabel = '',
      amountLabel = '',
      subtitle = '',
      icon = Icons.category_rounded,
      supportingLabel = null,
      _emptyMessage = null,
      _isLoading = true,
      _isEmpty = false;

  const TopCategoryCard.empty({
    super.key,
    required this.title,
    required String message,
  }) : categoryLabel = '',
       amountLabel = '',
       subtitle = '',
       icon = Icons.category_outlined,
       supportingLabel = null,
       _emptyMessage = message,
       _isLoading = false,
       _isEmpty = true;

  final String title;
  final String categoryLabel;
  final String amountLabel;
  final String subtitle;
  final IconData icon;
  final String? supportingLabel;
  final String? _emptyMessage;
  final bool _isLoading;
  final bool _isEmpty;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: colors.secondary.withValues(alpha: 0.14),
                      borderRadius: BorderRadiusDirectional.circular(
                        context.appRadius.lg,
                      ),
                    ),
                    child: Icon(
                      _isEmpty ? Icons.insights_outlined : icon,
                      color: colors.secondary,
                    ),
                  ),
                  SizedBox(width: spacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: theme.textTheme.titleMedium),
                        SizedBox(height: spacing.sm),
                        if (_isEmpty)
                          Text(
                            _emptyMessage!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          )
                        else ...[
                          Text(
                            categoryLabel,
                            style: theme.textTheme.headlineSmall,
                          ),
                          SizedBox(height: spacing.xs),
                          Text(
                            amountLabel,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colors.secondary,
                              fontWeight: FontWeight.w700,
                            ),
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
                          if (supportingLabel != null) ...[
                            SizedBox(height: spacing.sm),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: spacing.sm,
                                vertical: spacing.xs,
                              ),
                              decoration: BoxDecoration(
                                color: colors.secondary.withValues(alpha: 0.12),
                                borderRadius: BorderRadiusDirectional.circular(
                                  context.appRadius.pill,
                                ),
                              ),
                              child: Text(
                                supportingLabel!,
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: colors.secondary,
                                ),
                              ),
                            ),
                          ],
                        ],
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
              const _TopCategoryLine(widthFactor: 0.28),
              SizedBox(height: spacing.sm),
              const _TopCategoryLine(widthFactor: 0.4, height: 28),
              SizedBox(height: spacing.xs),
              const _TopCategoryLine(widthFactor: 0.3, height: 18),
              SizedBox(height: spacing.xs),
              const _TopCategoryLine(widthFactor: 0.55, height: 14),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopCategoryLine extends StatelessWidget {
  const _TopCategoryLine({required this.widthFactor, this.height = 16});

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
