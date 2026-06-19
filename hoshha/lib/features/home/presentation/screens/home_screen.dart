import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hoshha/theme/theme_extensions.dart';
import '../controllers/home_controller.dart';
import '../widgets/balance_card.dart';
import '../widgets/budget_status_card.dart';
import '../widgets/smart_tip_card.dart';
import '../widgets/quick_actions.dart';
import '../widgets/recent_transactions_list.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(homeControllerProvider);
    final colors = context.appColors;
    final spacing = context.appSpacing;

    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.01),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bell Icon (Notification)
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: colors.onSurface.withValues(alpha: 0.7),
                      size: 26,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isRtl ? 'لا توجد إشعارات جديدة' : 'No new notifications',
                          ),
                        ),
                      );
                    },
                  ),
                  // App Title & Avatar Group
                  Row(
                    children: [
                      const Text(
                        'Hawsha',
                        style: TextStyle(
                          color: Color(0xFF0B5A52),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colors.outline.withValues(alpha: 0.2),
                            width: 1.5,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=100&h=100&fit=crop',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: stateAsync.when(
        data: (state) {
          final isRtl = Directionality.of(context) == TextDirection.rtl;
          final smartTip = isRtl ? state.dashboardData.smartTipAr : state.dashboardData.smartTipEn;

          return RefreshIndicator(
            onRefresh: () => ref.read(homeControllerProvider.notifier).refresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.md),
              child: Column(
                children: [
                  BalanceCard(
                    currentBalance: state.dashboardData.currentBalance,
                    todayExpenses: state.dashboardData.todayExpenses,
                    monthExpenses: state.dashboardData.monthExpenses,
                  ),
                  const SizedBox(height: 16),
                  BudgetStatusCard(
                    budgetPercentage: state.dashboardData.budgetPercentage,
                  ),
                  const SizedBox(height: 16),
                  SmartTipCard(
                    smartTip: smartTip,
                  ),
                  const SizedBox(height: 24),
                  const QuickActions(),
                  const SizedBox(height: 24),
                  RecentTransactionsList(
                    transactions: state.transactions,
                    onViewAllPressed: () {
                      context.push('/history');
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isRtl ? 'حدث خطأ ما أثناء تحميل البيانات' : 'An error occurred while loading dashboard data',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.read(homeControllerProvider.notifier).refresh(),
                child: Text(isRtl ? 'إعادة المحاولة' : 'Retry'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentRoute: '/',
        onAddPressed: () {
          _showAddQuickTransaction(context, ref, isRtl);
        },
      ),
    );
  }

  void _showAddQuickTransaction(BuildContext context, WidgetRef ref, bool isRtl) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isRtl ? 'إضافة معاملة سريعة' : 'Quick Add Transaction',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: isRtl ? 'اسم المعاملة' : 'Transaction Name',
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
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        final title = titleController.text.trim();
                        final amount = double.tryParse(amountController.text.trim()) ?? 0.0;
                        if (title.isNotEmpty && amount > 0) {
                          ref.read(homeControllerProvider.notifier).addMockTransaction(
                            titleEn: title,
                            titleAr: title,
                            amount: amount,
                            category: 'food',
                            isIncome: false,
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: Text(isRtl ? 'إضافة مصروف (-)' : 'Add Expense (-)'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final title = titleController.text.trim();
                        final amount = double.tryParse(amountController.text.trim()) ?? 0.0;
                        if (title.isNotEmpty && amount > 0) {
                          ref.read(homeControllerProvider.notifier).addMockTransaction(
                            titleEn: title,
                            titleAr: title,
                            amount: amount,
                            category: 'salary',
                            isIncome: true,
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(isRtl ? 'إضافة دخل (+)' : 'Add Income (+)'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
