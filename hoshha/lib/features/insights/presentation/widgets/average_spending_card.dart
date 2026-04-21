import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class AverageSpendingCard extends StatelessWidget {
  const AverageSpendingCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
  }) : _isLoading = false;

  const AverageSpendingCard.loading({super.key})
    : title = '',
      value = '',
      subtitle = '',
      _isLoading = true;

  final String title;
  final String value;
  final String subtitle;
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
            ? const _AverageSpendingSkeleton()
            : Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadiusDirectional.circular(
                        context.appRadius.lg,
                      ),
                    ),
                    child: Icon(
                      Icons.auto_graph_rounded,
                      color: colors.primary,
                    ),
                  ),
                  SizedBox(width: spacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: theme.textTheme.titleMedium),
                        SizedBox(height: spacing.sm),
                        Text(value, style: theme.textTheme.headlineSmall),
                        SizedBox(height: spacing.xs),
                        Text(
                          subtitle,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.7,
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

class _AverageSpendingSkeleton extends StatelessWidget {
  const _AverageSpendingSkeleton();

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
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
            children: const [
              _AverageSkeletonLine(widthFactor: 0.34),
              SizedBox(height: 12),
              _AverageSkeletonLine(widthFactor: 0.44, height: 28),
              SizedBox(height: 8),
              _AverageSkeletonLine(widthFactor: 0.68, height: 14),
            ],
          ),
        ),
      ],
    );
  }
}

class _AverageSkeletonLine extends StatelessWidget {
  const _AverageSkeletonLine({required this.widthFactor, this.height = 16});

  final double widthFactor;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.hasBoundedWidth
            ? constraints.maxWidth * widthFactor
            : 320.0 * widthFactor;

        return Align(
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
            width: width,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: colors.surfaceContainer,
                borderRadius: BorderRadiusDirectional.circular(
                  context.appRadius.sm,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
