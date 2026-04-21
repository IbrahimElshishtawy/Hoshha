import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/errors/app_failure.dart';
import '../../../../theme/theme_extensions.dart';
import '../../../expenses/application/models/budget_status.dart';
import '../../../expenses/application/models/monthly_summary.dart';
import '../../../expenses/expenses_providers.dart';
import '../controllers/budget_controller.dart';
import '../widgets/budget_form.dart';
import '../widgets/budget_summary_card.dart';
import '../widgets/set_budget_button.dart';

class BudgetScreen extends ConsumerStatefulWidget {
  const BudgetScreen({super.key});

  @override
  ConsumerState<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends ConsumerState<BudgetScreen> {
  static const _maxContentWidth = 600.0;
  static const _switchDuration = Duration(milliseconds: 240);

  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(budgetControllerProvider, (previous, next) {
      final wasSubmitting = previous?.isLoading ?? false;
      if (!wasSubmitting || !mounted) {
        return;
      }

      next.whenOrNull(
        data: (_) {
          setState(() => _isEditing = false);
          _showSnackBar('تم حفظ الميزانية بنجاح');
        },
        error: (error, _) {
          _showSnackBar(_errorMessage(error));
        },
      );
    });

    final spacing = context.appSpacing;
    final summaryAsync = ref.watch(monthlySummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('الميزانية')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxContentWidth),
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.all(spacing.lg),
              child: summaryAsync.when(
                loading: () => const _BudgetLoadingState(),
                error: (error, _) => _BudgetErrorState(
                  onRetry: () {
                    ref.invalidate(monthlySummaryProvider);
                  },
                ),
                data: (summary) => _BudgetContent(
                  summary: summary,
                  status: ref
                      .watch(budgetStatusCalculatorProvider)
                      .call(summary),
                  isEditing: _isEditing,
                  isSubmitting: ref.watch(budgetControllerProvider).isLoading,
                  onStartEditing: () => setState(() => _isEditing = true),
                  onCancelEditing: () => setState(() => _isEditing = false),
                  onSubmit: (limitMinor) async {
                    await ref
                        .read(budgetControllerProvider.notifier)
                        .submit(limitMinor: limitMinor);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  String _errorMessage(Object error) {
    if (error is AppFailure) {
      return switch (error.type) {
        AppFailureType.validation => 'لازم الميزانية تكون أكبر من صفر',
        AppFailureType.storage => 'حصلت مشكلة وإحنا بنحفظ الميزانية',
        _ => 'حصلت مشكلة غير متوقعة',
      };
    }

    return 'حصلت مشكلة وإحنا بنحفظ الميزانية';
  }
}

class _BudgetContent extends StatelessWidget {
  const _BudgetContent({
    required this.summary,
    required this.status,
    required this.isEditing,
    required this.isSubmitting,
    required this.onStartEditing,
    required this.onCancelEditing,
    required this.onSubmit,
  });

  final MonthlySummary summary;
  final BudgetStatus status;
  final bool isEditing;
  final bool isSubmitting;
  final VoidCallback onStartEditing;
  final VoidCallback onCancelEditing;
  final Future<void> Function(int limitMinor) onSubmit;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final hasBudget = summary.hasBudget;
    final remainingMinor = summary.remainingBudgetMinor < 0
        ? 0
        : summary.remainingBudgetMinor;
    final progress = summary.budgetLimitMinor == 0
        ? 0.0
        : summary.spentMinor / summary.budgetLimitMinor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedSwitcher(
          duration: _BudgetScreenState._switchDuration,
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: hasBudget
              ? BudgetSummaryCard(
                  key: const ValueKey('budget-summary-card'),
                  budgetValue: _formatMoney(context, summary.budgetLimitMinor),
                  spentValue: _formatMoney(context, summary.spentMinor),
                  remainingValue: _formatMoney(context, remainingMinor),
                  progress: progress.clamp(0.0, 1.0),
                  status: status,
                  note: summary.remainingBudgetMinor < 0
                      ? 'إنت فوق الميزانية بـ ${_formatMoney(context, summary.remainingBudgetMinor.abs())}'
                      : null,
                )
              : const BudgetSummaryCard.empty(
                  key: ValueKey('budget-empty-card'),
                  emptyTitle: 'لسه ما حددتش ميزانيتك',
                  emptyMessage:
                      'حدد ميزانية الشهر الحالي علشان تتابع المصروف والمتبقي بسهولة.',
                ),
        ),
        SizedBox(height: spacing.lg),
        AnimatedSwitcher(
          duration: _BudgetScreenState._switchDuration,
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: isEditing
              ? BudgetForm(
                  key: ValueKey('budget-form-${summary.budgetLimitMinor}'),
                  title: hasBudget ? 'تعديل الميزانية' : 'حدد الميزانية',
                  initialAmount: _initialAmountValue(summary.budgetLimitMinor),
                  isLoading: isSubmitting,
                  onCancel: onCancelEditing,
                  onSubmit: onSubmit,
                )
              : SetBudgetButton(
                  key: ValueKey('budget-action-$hasBudget'),
                  label: hasBudget ? 'تعديل الميزانية' : 'حدد الميزانية',
                  onPressed: onStartEditing,
                ),
        ),
      ],
    );
  }

  String _formatMoney(BuildContext context, int minorUnits) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: locale.startsWith('ar') ? 'ج.م' : 'EGP',
      decimalDigits: minorUnits % 100 == 0 ? 0 : 2,
    );

    return formatter.format(minorUnits / 100);
  }

  String _initialAmountValue(int minorUnits) {
    if (minorUnits <= 0) {
      return '';
    }

    if (minorUnits % 100 == 0) {
      return (minorUnits / 100).round().toString();
    }

    return (minorUnits / 100).toStringAsFixed(2);
  }
}

class _BudgetLoadingState extends StatelessWidget {
  const _BudgetLoadingState();

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.xl),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _BudgetErrorState extends StatelessWidget {
  const _BudgetErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('مش قادرين نحمل بيانات الميزانية دلوقتي'),
            SizedBox(height: spacing.md),
            SetBudgetButton(label: 'حاول تاني', onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}
