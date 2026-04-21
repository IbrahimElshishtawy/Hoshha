import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../theme/theme_extensions.dart';
import 'set_budget_button.dart';

class BudgetForm extends StatefulWidget {
  const BudgetForm({
    super.key,
    required this.title,
    required this.initialAmount,
    required this.isLoading,
    required this.onSubmit,
    this.onCancel,
  });

  final String title;
  final String initialAmount;
  final bool isLoading;
  final Future<void> Function(int limitMinor) onSubmit;
  final VoidCallback? onCancel;

  @override
  State<BudgetForm> createState() => _BudgetFormState();
}

class _BudgetFormState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;

  bool _canSubmit = false;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.initialAmount)
      ..addListener(_handleFormChanged);
    _handleFormChanged();
  }

  @override
  void didUpdateWidget(covariant BudgetForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialAmount != widget.initialAmount &&
        _amountController.text != widget.initialAmount) {
      _amountController.text = widget.initialAmount;
      _handleFormChanged();
    }
  }

  @override
  void dispose() {
    _amountController
      ..removeListener(_handleFormChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: spacing.lg),
              TextFormField(
                controller: _amountController,
                enabled: !widget.isLoading,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9٠-٩.,٬٫\s]')),
                ],
                decoration: const InputDecoration(
                  labelText: 'قيمة الميزانية',
                  hintText: 'مثال: 5000',
                  prefixIcon: Icon(Icons.account_balance_wallet_outlined),
                ),
                validator: _validateAmount,
                onFieldSubmitted: (_) => _submit(),
              ),
              SizedBox(height: spacing.sm),
              Text(
                'لازم تكون أكبر من صفر',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.68),
                ),
              ),
              SizedBox(height: spacing.lg),
              Row(
                children: [
                  if (widget.onCancel != null) ...[
                    TextButton(
                      onPressed: widget.isLoading ? null : widget.onCancel,
                      child: const Text('إلغاء'),
                    ),
                    SizedBox(width: spacing.md),
                  ],
                  Expanded(
                    child: SetBudgetButton(
                      label: 'حفظ الميزانية',
                      isLoading: widget.isLoading,
                      isEnabled: _canSubmit,
                      onPressed: _submit,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    final limitMinor = _parseAmountMinor(_amountController.text);
    if (limitMinor == null || limitMinor <= 0) {
      return;
    }

    await widget.onSubmit(limitMinor);
  }

  void _handleFormChanged() {
    final nextCanSubmit = (_parseAmountMinor(_amountController.text) ?? 0) > 0;
    if (nextCanSubmit != _canSubmit && mounted) {
      setState(() => _canSubmit = nextCanSubmit);
    }
  }

  String? _validateAmount(String? value) {
    final amountMinor = _parseAmountMinor(value ?? '');
    if (amountMinor == null) {
      return 'اكتب رقم صحيح';
    }

    if (amountMinor <= 0) {
      return 'لازم الميزانية تكون أكبر من صفر';
    }

    return null;
  }

  int? _parseAmountMinor(String raw) {
    final normalized = _normalizeNumericInput(raw);
    if (normalized.isEmpty) {
      return null;
    }

    final value = double.tryParse(normalized);
    if (value == null) {
      return null;
    }

    return (value * 100).round();
  }

  String _normalizeNumericInput(String value) {
    const arabicDigits = <String, String>{
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    final buffer = StringBuffer();
    for (final character in value.trim().split('')) {
      buffer.write(arabicDigits[character] ?? character);
    }

    return buffer
        .toString()
        .replaceAll(' ', '')
        .replaceAll('٬', '')
        .replaceAll(',', '.')
        .replaceAll('٫', '.');
  }
}
