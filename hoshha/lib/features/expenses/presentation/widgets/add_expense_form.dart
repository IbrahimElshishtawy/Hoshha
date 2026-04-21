import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/theme_extensions.dart';
import '../../application/models/record_expense_input.dart';
import '../controllers/add_expense_controller.dart';
import 'amount_input_field.dart';
import 'category_selector.dart';
import 'date_selector.dart';
import 'note_input_field.dart';
import 'save_expense_button.dart';

class AddExpenseForm extends ConsumerStatefulWidget {
  const AddExpenseForm({super.key});

  @override
  ConsumerState<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends ConsumerState<AddExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _noteController;

  DateTime _selectedDate = DateTime.now();
  String? _selectedCategoryId;
  bool _canSubmit = false;
  bool _hasSubmitted = false;
  bool _categoryTouched = false;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController()
      ..addListener(_handleFormChanged);
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController
      ..removeListener(_handleFormChanged)
      ..dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final controllerState = ref.watch(addExpenseControllerProvider);
    final categoryOptions = ref.watch(expenseCategoryOptionsProvider);
    final isSubmitting = controllerState.isLoading;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _FormSectionCard(
            title: 'تفاصيل المصروف',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AmountInputField(
                  controller: _amountController,
                  enabled: !isSubmitting,
                  onChanged: (_) => _handleFormChanged(),
                  validator: _validateAmount,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9٠-٩.,٬٫\s]'),
                    ),
                  ],
                ),
                SizedBox(height: spacing.lg),
                CategorySelector(
                  options: categoryOptions,
                  selectedCategoryId: _selectedCategoryId,
                  enabled: !isSubmitting,
                  errorText: _categoryErrorText,
                  onSelected: _handleCategorySelected,
                ),
              ],
            ),
          ),
          SizedBox(height: spacing.lg),
          _FormSectionCard(
            title: 'معلومات إضافية',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DateSelector(
                  selectedDate: _selectedDate,
                  enabled: !isSubmitting,
                  onPressed: () => _pickDate(context),
                ),
                SizedBox(height: spacing.lg),
                NoteInputField(
                  controller: _noteController,
                  enabled: !isSubmitting,
                ),
              ],
            ),
          ),
          SizedBox(height: spacing.xl),
          SaveExpenseButton(
            isEnabled: _canSubmit,
            isLoading: isSubmitting,
            onPressed: isSubmitting ? null : _submit,
          ),
        ],
      ),
    );
  }

  String? get _categoryErrorText {
    final shouldShowError = _hasSubmitted || _categoryTouched;
    if (!shouldShowError || _selectedCategoryId != null) {
      return null;
    }

    return 'اختر فئة المصروف';
  }

  void _handleFormChanged() {
    final nextCanSubmit =
        (_parseAmountMinor(_amountController.text) ?? 0) > 0 &&
        _selectedCategoryId != null;

    if (nextCanSubmit != _canSubmit && mounted) {
      setState(() => _canSubmit = nextCanSubmit);
    }
  }

  void _handleCategorySelected(String categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
      _categoryTouched = true;
      _canSubmit =
          (_parseAmountMinor(_amountController.text) ?? 0) > 0 &&
          _selectedCategoryId != null;
    });
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      locale: Localizations.localeOf(context),
      initialDate: _selectedDate.isAfter(now) ? now : _selectedDate,
      firstDate: DateTime(2020),
      lastDate: now,
      helpText: 'اختيار التاريخ',
      cancelText: 'إلغاء',
      confirmText: 'حفظ',
    );

    if (pickedDate == null || !mounted) {
      return;
    }

    setState(() {
      _selectedDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        _selectedDate.hour,
        _selectedDate.minute,
        _selectedDate.second,
        _selectedDate.millisecond,
        _selectedDate.microsecond,
      );
    });
  }

  Future<void> _submit() async {
    setState(() => _hasSubmitted = true);
    FocusScope.of(context).unfocus();

    final isFormValid = _formKey.currentState?.validate() ?? false;
    if (!isFormValid || _selectedCategoryId == null) {
      setState(() {});
      return;
    }

    final amountMinor = _parseAmountMinor(_amountController.text);
    if (amountMinor == null || amountMinor <= 0) {
      setState(() {});
      return;
    }

    await ref
        .read(addExpenseControllerProvider.notifier)
        .submit(
          RecordExpenseInput(
            amountMinor: amountMinor,
            categoryId: _selectedCategoryId!,
            occurredAt: _selectedDate,
            note: _normalizedNote,
          ),
        );
  }

  String? _validateAmount(String? value) {
    final amountMinor = _parseAmountMinor(value ?? '');
    if (amountMinor == null) {
      return 'أدخل مبلغاً صحيحاً';
    }

    if (amountMinor <= 0) {
      return 'يجب أن يكون المبلغ أكبر من صفر';
    }

    return null;
  }

  String? get _normalizedNote {
    final value = _noteController.text.trim();
    if (value.isEmpty) {
      return null;
    }

    return value;
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

class _FormSectionCard extends StatelessWidget {
  const _FormSectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: spacing.lg),
            child,
          ],
        ),
      ),
    );
  }
}
