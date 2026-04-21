import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import 'insight_info_tile.dart';

class InsightsSummaryCard extends StatelessWidget {
  const InsightsSummaryCard({
    super.key,
    required this.title,
    required this.spentValue,
    required this.budgetValue,
    required this.remainingValue,
    required this.expenseCountValue,
    this.subtitle,
    this.spentSubtitle,
    this.budgetSubtitle,
    this.remainingSubtitle,
    this.expenseCountSubtitle,
  }) : _isLoading = false;

  const InsightsSummaryCard.loading({super.key})
    : title = '',
      spentValue = '',
      budgetValue = '',
      remainingValue = '',
      expenseCountValue = '',
      subtitle = null,
      spentSubtitle = null,
      budgetSubtitle = null,
      remainingSubtitle = null,
      expenseCountSubtitle = null,
      _isLoading = true;

  final String title;
  final String spentValue;
  final String budgetValue;
  final String remainingValue;
  final String expenseCountValue;
  final String? subtitle;
  final String? spentSubtitle;
  final String? budgetSubtitle;
  final String? remainingSubtitle;
  final String? expenseCountSubtitle;
  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: _isLoading
            ? const _SummaryCardSkeleton()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium),
                  if (subtitle != null) ...[
                    SizedBox(height: spacing.xs),
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: spacing.lg),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth >= 560
                          ? (constraints.maxWidth - spacing.md) / 2
                          : constraints.maxWidth;

                      final tiles = [
                        SizedBox(
                          width: width,
                          child: InsightInfoTile(
                            title: 'إجمالي الصرف',
                            value: spentValue,
                            subtitle: spentSubtitle,
                            icon: Icons.payments_rounded,
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: InsightInfoTile(
                            title: 'الميزانية',
                            value: budgetValue,
                            subtitle: budgetSubtitle,
                            icon: Icons.account_balance_wallet_rounded,
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: InsightInfoTile(
                            title: 'المتبقي',
                            value: remainingValue,
                            subtitle: remainingSubtitle,
                            icon: Icons.savings_rounded,
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: InsightInfoTile(
                            title: 'عدد المصاريف',
                            value: expenseCountValue,
                            subtitle: expenseCountSubtitle,
                            icon: Icons.receipt_long_rounded,
                          ),
                        ),
                      ];

                      return Wrap(
                        spacing: spacing.md,
                        runSpacing: spacing.md,
                        children: tiles,
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

class _SummaryCardSkeleton extends StatelessWidget {
  const _SummaryCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    Widget skeletonBox({required double widthFactor, required double height}) {
      return FractionallySizedBox(
        widthFactor: widthFactor,
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: BorderRadiusDirectional.circular(
              context.appRadius.sm,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        skeletonBox(widthFactor: 0.34, height: 18),
        SizedBox(height: spacing.sm),
        skeletonBox(widthFactor: 0.48, height: 14),
        SizedBox(height: spacing.lg),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth >= 560
                ? (constraints.maxWidth - spacing.md) / 2
                : constraints.maxWidth;

            return Wrap(
              spacing: spacing.md,
              runSpacing: spacing.md,
              children: List.generate(
                4,
                (_) => Container(
                  width: width,
                  height: 128,
                  decoration: BoxDecoration(
                    color: colors.surfaceContainer,
                    borderRadius: BorderRadiusDirectional.circular(
                      context.appRadius.md,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
