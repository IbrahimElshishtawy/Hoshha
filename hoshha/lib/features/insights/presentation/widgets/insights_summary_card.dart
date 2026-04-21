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
                          alpha: 0.68,
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: spacing.lg),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth >= 560;
                      final tileWidth = isWide
                          ? (constraints.maxWidth - spacing.md) / 2
                          : constraints.maxWidth;

                      return Wrap(
                        spacing: spacing.md,
                        runSpacing: spacing.md,
                        children: [
                          SizedBox(
                            width: tileWidth,
                            child: InsightInfoTile(
                              title: 'إجمالي الصرف',
                              value: spentValue,
                              subtitle: spentSubtitle,
                              icon: Icons.payments_rounded,
                            ),
                          ),
                          SizedBox(
                            width: tileWidth,
                            child: InsightInfoTile(
                              title: 'الميزانية',
                              value: budgetValue,
                              subtitle: budgetSubtitle,
                              icon: Icons.account_balance_wallet_rounded,
                            ),
                          ),
                          SizedBox(
                            width: tileWidth,
                            child: InsightInfoTile(
                              title: 'المتبقي',
                              value: remainingValue,
                              subtitle: remainingSubtitle,
                              icon: Icons.savings_rounded,
                            ),
                          ),
                          SizedBox(
                            width: tileWidth,
                            child: InsightInfoTile(
                              title: 'عدد المصاريف',
                              value: expenseCountValue,
                              subtitle: expenseCountSubtitle,
                              icon: Icons.receipt_long_rounded,
                            ),
                          ),
                        ],
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

    Widget line({required double widthFactor, required double height}) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        line(widthFactor: 0.34, height: 18),
        SizedBox(height: spacing.sm),
        line(widthFactor: 0.46, height: 14),
        SizedBox(height: spacing.lg),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 560;
            final tileWidth = isWide
                ? (constraints.maxWidth - spacing.md) / 2
                : constraints.maxWidth;

            return Wrap(
              spacing: spacing.md,
              runSpacing: spacing.md,
              children: List.generate(
                4,
                (_) => Container(
                  width: tileWidth,
                  height: 132,
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
