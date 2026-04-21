import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import 'home_empty_state_banner.dart';

enum BudgetSummaryTone { safe, warning, exceeded }

class BudgetSummaryCard extends StatelessWidget {
  const BudgetSummaryCard({
    super.key,
    required this.title,
    required this.spentLabel,
    required this.spentValue,
    this.remainingLabel,
    this.remainingValue,
    this.statusLabel,
    this.tone = BudgetSummaryTone.safe,
    this.progress,
    this.limitLabel,
    this.overflowMessage,
    this.actionLabel,
    this.onActionPressed,
  }) : setupTitle = null,
       setupMessage = null;

  const BudgetSummaryCard.setup({
    super.key,
    required this.title,
    required this.setupTitle,
    required this.setupMessage,
    this.actionLabel,
    this.onActionPressed,
  }) : spentLabel = null,
       spentValue = null,
       remainingLabel = null,
       remainingValue = null,
       statusLabel = null,
       tone = BudgetSummaryTone.safe,
       progress = null,
       limitLabel = null,
       overflowMessage = null;

  final String title;
  final String? spentLabel;
  final String? spentValue;
  final String? remainingLabel;
  final String? remainingValue;
  final String? statusLabel;
  final BudgetSummaryTone tone;
  final double? progress;
  final String? limitLabel;
  final String? overflowMessage;
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final String? setupTitle;
  final String? setupMessage;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: setupTitle != null
            ? HomeEmptyStateBanner(
                icon: Icons.savings_outlined,
                title: setupTitle!,
                message: setupMessage!,
                actionLabel: actionLabel,
                onActionPressed: onActionPressed,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Header(
                    title: title,
                    statusLabel: statusLabel,
                    tone: tone,
                    actionLabel: actionLabel,
                    onActionPressed: onActionPressed,
                  ),
                  SizedBox(height: spacing.lg),
                  Row(
                    children: [
                      Expanded(
                        child: _MetricBlock(
                          label: spentLabel!,
                          value: spentValue!,
                        ),
                      ),
                      SizedBox(width: spacing.md),
                      Expanded(
                        child: _MetricBlock(
                          label: remainingLabel!,
                          value: remainingValue!,
                        ),
                      ),
                    ],
                  ),
                  if (limitLabel != null) ...[
                    SizedBox(height: spacing.md),
                    Text(
                      limitLabel!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.72),
                      ),
                    ),
                  ],
                  if (overflowMessage != null) ...[
                    SizedBox(height: spacing.sm),
                    Text(
                      overflowMessage!,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: _toneColor(context),
                      ),
                    ),
                  ],
                  if (progress != null) ...[
                    SizedBox(height: spacing.md),
                    _ProgressBar(
                      value: math.max(0, math.min(progress!, 1)),
                      color: _toneColor(context),
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  Color _toneColor(BuildContext context) {
    final colors = context.appColors;
    return switch (tone) {
      BudgetSummaryTone.safe => colors.success,
      BudgetSummaryTone.warning => colors.warning,
      BudgetSummaryTone.exceeded => colors.error,
    };
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.title,
    required this.statusLabel,
    required this.tone,
    required this.actionLabel,
    required this.onActionPressed,
  });

  final String title;
  final String? statusLabel;
  final BudgetSummaryTone tone;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final toneColor = switch (tone) {
      BudgetSummaryTone.safe => context.appColors.success,
      BudgetSummaryTone.warning => context.appColors.warning,
      BudgetSummaryTone.exceeded => context.appColors.error,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            if (statusLabel != null)
              _StatusChip(label: statusLabel!, color: toneColor),
          ],
        ),
        if (actionLabel != null && onActionPressed != null) ...[
          SizedBox(height: spacing.sm),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton(
              onPressed: onActionPressed,
              child: Text(actionLabel!),
            ),
          ),
        ],
      ],
    );
  }
}

class _MetricBlock extends StatelessWidget {
  const _MetricBlock({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: spacing.sm),
          Text(
            value,
            style: theme.textTheme.headlineMedium?.copyWith(fontSize: 26),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: spacing.md,
        vertical: spacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadiusDirectional.circular(context.appRadius.pill),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.value, required this.color});

  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final radius = BorderRadiusDirectional.circular(
      context.appRadius.pill,
    ).resolve(Directionality.of(context));

    return ClipRRect(
      borderRadius: radius,
      child: LinearProgressIndicator(
        value: value,
        minHeight: 10,
        color: color,
        backgroundColor: colors.surfaceContainer,
      ),
    );
  }
}
