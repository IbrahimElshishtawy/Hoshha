import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'package:hoshha/theme/theme_extensions.dart';
import '../controllers/home_controller.dart';

class QuickActions extends ConsumerWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.homeQuickActions,
          style: TextStyle(
            color: colors.onSurface.withValues(alpha: 0.8),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.4,
          children: [
            _buildActionCard(
              context: context,
              label: l10n.homeAddExpense,
              icon: Icons.credit_card_outlined,
              iconColor: colors.primary,
              bgColor: colors.primary.withValues(alpha: 0.08),
              onTap: () => _showAddTransactionDialog(context, ref, isIncome: false),
            ),
            _buildActionCard(
              context: context,
              label: l10n.homeAddIncome,
              icon: Icons.payments_outlined,
              iconColor: const Color(0xFF8B6F15),
              bgColor: const Color(0xFF8B6F15).withValues(alpha: 0.08),
              onTap: () => _showAddTransactionDialog(context, ref, isIncome: true),
            ),
            _buildActionCard(
              context: context,
              label: l10n.homeToSavings,
              icon: Icons.savings_outlined,
              iconColor: Colors.blue.shade700,
              bgColor: Colors.blue.shade50.withValues(alpha: 0.8),
              onTap: () => _showSavingsMessage(context),
            ),
            _buildActionCard(
              context: context,
              label: l10n.homeCreateGoal,
              icon: Icons.track_changes_outlined,
              iconColor: Colors.purple.shade700,
              bgColor: Colors.purple.shade50.withValues(alpha: 0.8),
              onTap: () => _showGoalMessage(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: colors.outline.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius.md),
          child: Padding(
            padding: EdgeInsets.all(spacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: colors.onSurface.withValues(alpha: 0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: Center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddTransactionDialog(BuildContext context, WidgetRef ref, {required bool isIncome}) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isIncome
              ? (isRtl ? 'إضافة دخل موك' : 'Add Mock Income')
              : (isRtl ? 'إضافة مصروف موك' : 'Add Mock Expense')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: isRtl ? 'العنوان (مثال: راتب، بقالة)' : 'Title (e.g. Salary, Grocery)',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: isRtl ? 'المبلغ' : 'Amount',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(isRtl ? 'إلغاء' : 'Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final amount = double.tryParse(amountController.text.trim()) ?? 0.0;
                if (title.isNotEmpty && amount > 0) {
                  ref.read(homeControllerProvider.notifier).addMockTransaction(
                    titleEn: title,
                    titleAr: title,
                    amount: amount,
                    category: isIncome ? 'salary' : 'food',
                    isIncome: isIncome,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text(isRtl ? 'إضافة' : 'Add'),
            ),
          ],
        );
      },
    );
  }

  void _showSavingsMessage(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isRtl ? 'سيتم ربط التحويل للحصالة لاحقاً!' : 'Savings feature will be connected soon!'),
      ),
    );
  }

  void _showGoalMessage(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isRtl ? 'سيتم ربط إنشاء الأهداف لاحقاً!' : 'Goal creation will be connected soon!'),
      ),
    );
  }
}
