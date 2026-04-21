import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import '../../../expenses/application/models/budget_status.dart';

class BudgetStatusChip extends StatelessWidget {
  const BudgetStatusChip({super.key, required this.status});

  final BudgetStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final toneColor = switch (status) {
      BudgetStatus.safe => colors.success,
      BudgetStatus.warning => colors.warning,
      BudgetStatus.exceeded => colors.error,
    };

    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: spacing.md,
        vertical: spacing.xs,
      ),
      decoration: BoxDecoration(
        color: toneColor.withValues(alpha: 0.12),
        borderRadius: BorderRadiusDirectional.circular(context.appRadius.pill),
      ),
      child: Text(
        _label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: toneColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  String get _label {
    return switch (status) {
      BudgetStatus.safe => 'آمن',
      BudgetStatus.warning => 'قربت تخلص',
      BudgetStatus.exceeded => 'عدّيت الميزانية',
    };
  }
}
