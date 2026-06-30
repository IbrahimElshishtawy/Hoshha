import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../cubit/transaction_cubit.dart';
import '../cubit/transaction_state.dart';
import '../widgets/transaction_amount_input.dart';
import '../widgets/transaction_date_time_row.dart';
import '../widgets/transaction_quick_actions.dart';
import '../widgets/transaction_selector_card.dart';
import '../widgets/transaction_type_selector.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String _activeType = 'expense'; // 'expense', 'income', 'transfer'
  final _amountController = TextEditingController(text: '0.00');
  final _notesController = TextEditingController();

  // Mock selected values for simplicity
  final String _selectedCategory = 'shopping_bag';
  final String _selectedWallet = 'محفظتي الشخصية';
  final String _selectedDate = 'اليوم';
  final String _selectedTime = '10:45 ص';

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    if (amount <= 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى إدخال مبلغ صحيح أكبر من الصفر'),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    context.read<TransactionCubit>().saveTransaction(
          title: _activeType == 'income' ? 'إيداع دخل' : (_activeType == 'transfer' ? 'تحويل مالي' : 'مشتريات'),
          amount: amount,
          type: _activeType,
          category: _selectedCategory,
          date: _selectedDate,
          time: _selectedTime,
          notes: _notesController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => sl<TransactionCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withValues(alpha: 0.7),
          elevation: 2.0,
          shadowColor: Colors.black12,
          title: Text(
            'إضافة معاملة',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppTheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close, color: AppTheme.onSurfaceVariant),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocListener<TransactionCubit, TransactionState>(
          listener: (context, state) {
            if (state is TransactionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم حفظ المعاملة بنجاح!'),
                  backgroundColor: AppTheme.secondary,
                ),
              );
              Navigator.pop(context);
            } else if (state is TransactionFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('فشل حفظ المعاملة: ${state.message}'),
                  backgroundColor: AppTheme.error,
                ),
              );
            }
          },
          child: Stack(
            children: [
              // Background glows
              Positioned(
                top: 0,
                right: 0,
                width: 256,
                height: 256,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.primary.withValues(alpha: 0.03),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                width: 320,
                height: 320,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.secondary.withValues(alpha: 0.03),
                    ),
                  ),
                ),
              ),

              // Scrollable fields
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: AppTheme.containerMargin,
                    right: AppTheme.containerMargin,
                    top: 20.0,
                    bottom: 100.0, // Space for fixed save button
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Segmented control (Type selector)
                      TransactionTypeSelector(
                        activeType: _activeType,
                        onTypeChanged: (type) {
                          setState(() {
                            _activeType = type;
                          });
                        },
                      ),
                      const SizedBox(height: 32.0),

                      // Amount Input
                      TransactionAmountInput(controller: _amountController),
                      const SizedBox(height: 32.0),

                      // Category Selector (with AI suggestion)
                      _buildLabel('تصنيف'),
                      TransactionSelectorCard(
                        icon: Icons.category,
                        iconBgColor: AppTheme.primaryContainer.withValues(alpha: 0.1),
                        iconColor: AppTheme.primaryContainer,
                        title: 'اختر التصنيف',
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryContainer.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            'AI Suggestion',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppTheme.primaryContainer,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Wallet Selector
                      _buildLabel('المحفظة'),
                      TransactionSelectorCard(
                        icon: Icons.account_balance_wallet,
                        iconBgColor: AppTheme.secondaryContainer.withValues(alpha: 0.2),
                        iconColor: AppTheme.secondary,
                        title: _selectedWallet,
                      ),
                      const SizedBox(height: 16.0),

                      // Date & Time Row
                      TransactionDateTimeRow(
                        date: _selectedDate,
                        time: _selectedTime,
                      ),
                      const SizedBox(height: 16.0),

                      // Notes text input
                      _buildLabel('ملاحظات'),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                        ),
                        child: TextField(
                          controller: _notesController,
                          maxLines: 2,
                          textAlign: TextAlign.right,
                          decoration: const InputDecoration(
                            hintText: 'أضف ملاحظاتك هنا...',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            filled: false,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),

                      // Quick Actions Row (Mic, Camera, Location)
                      const TransactionQuickActions(),
                    ],
                  ),
                ),
              ),

              // Fixed Save Button at the bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Builder(
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(AppTheme.containerMargin),
                      color: Colors.white.withValues(alpha: 0.7),
                      child: BlocBuilder<TransactionCubit, TransactionState>(
                        builder: (context, state) {
                          final isSubmitting = state is TransactionSubmitting;

                          return ElevatedButton(
                            onPressed: isSubmitting ? null : () => _submit(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primary,
                              minimumSize: const Size.fromHeight(56.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (isSubmitting)
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                else ...[
                                  const Icon(Icons.check_circle, color: Colors.white),
                                  const SizedBox(width: 8.0),
                                  const Text(
                                    'حفظ المعاملة',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ]
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.onSurfaceVariant,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
