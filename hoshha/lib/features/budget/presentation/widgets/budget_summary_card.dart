import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import '../../../expenses/application/models/budget_status.dart';
import 'budget_status_chip.dart';

class BudgetSummaryCard extends StatelessWidget {
  const BudgetSummaryCard({
    super.key,
    required this.budgetValue,
    required this.spentValue,
    required this.remainingValue,
    required this.progress,
    required this.status,
    this.note,
  }) : emptyTitle = null,
       emptyMessage = null;

  const BudgetSummaryCard.empty({
    super.key,
    required this.emptyTitle,
    required this.emptyMessage,
  }) : budgetValue = null,
       spentValue = null,
       remainingValue = null,
       progress = null,
       status = null,
       note = null;

  final String? budgetValue;
  final String? spentValue;
  final String? remainingValue;
  final double? progress;
  final BudgetStatus? status;
  final String? note;
  final String? emptyTitle;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: emptyTitle != null
            ? _EmptyBudgetState(title: emptyTitle!, message: emptyMessage!)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'ميزانية الشهر الحالي',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      BudgetStatusChip(status: status!),
                    ],
                  ),
                  SizedBox(height: spacing.lg),
                  _MetricsSection(
                    budgetValue: budgetValue!,
                    spentValue: spentValue!,
                    remainingValue: remainingValue!,
                  ),
                  SizedBox(height: spacing.lg),
                  _AnimatedBudgetProgress(value: progress!, status: status!),
                  if (note != null) ...[
                    SizedBox(height: spacing.sm),
                    Text(
                      note!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _toneColor(context, status!),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  Color _toneColor(BuildContext context, BudgetStatus status) {
    final colors = context.appColors;
    return switch (status) {
      BudgetStatus.safe => colors.success,
      BudgetStatus.warning => colors.warning,
      BudgetStatus.exceeded => colors.error,
    };
  }
}

class _EmptyBudgetState extends StatelessWidget {
  const _EmptyBudgetState({required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: spacing.xl + spacing.xl,
          height: spacing.xl + spacing.xl,
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: BorderRadiusDirectional.circular(
              context.appRadius.lg,
            ),
          ),
          child: Icon(
            Icons.savings_outlined,
            color: colors.primary,
            size: spacing.xl,
          ),
        ),
        SizedBox(height: spacing.lg),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: spacing.sm),
        Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}

class _MetricsSection extends StatelessWidget {
  const _MetricsSection({
    required this.budgetValue,
    required this.spentValue,
    required this.remainingValue,
  });

  final String budgetValue;
  final String spentValue;
  final String remainingValue;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 520) {
          return Column(
            children: [
              _MetricTile(label: 'الميزانية', value: budgetValue),
              SizedBox(height: spacing.md),
              _MetricTile(label: 'المصروف', value: spentValue),
              SizedBox(height: spacing.md),
              _MetricTile(label: 'المتبقي', value: remainingValue),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              child: _MetricTile(label: 'الميزانية', value: budgetValue),
            ),
            SizedBox(width: spacing.md),
            Expanded(
              child: _MetricTile(label: 'المصروف', value: spentValue),
            ),
            SizedBox(width: spacing.md),
            Expanded(
              child: _MetricTile(label: 'المتبقي', value: remainingValue),
            ),
          ],
        );
      },
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
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
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.72),
            ),
          ),
          SizedBox(height: spacing.sm),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}

class _AnimatedBudgetProgress extends StatelessWidget {
  const _AnimatedBudgetProgress({required this.value, required this.status});

  final double value;
  final BudgetStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final color = switch (status) {
      BudgetStatus.safe => colors.success,
      BudgetStatus.warning => colors.warning,
      BudgetStatus.exceeded => colors.error,
    };

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value.clamp(0, 1)),
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
            color: color,
            backgroundColor: colors.surfaceContainer,
          ),
        );
      },
    );
  }
}
