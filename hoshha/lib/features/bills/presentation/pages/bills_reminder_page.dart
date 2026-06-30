import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/bill_alert_card.dart';
import '../widgets/bill_list_item.dart';

class BillsReminderPage extends StatelessWidget {
  const BillsReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock bills data
    final bills = [
      const BillItemData(
        title: 'فاتورة الكهرباء (الشركة السعودية)',
        amount: 350.0,
        dueDate: 'في خلال يومين',
        isOverdue: false,
        icon: Icons.electric_bolt,
      ),
      const BillItemData(
        title: 'اشتراك الإنترنت المنزلي (STC)',
        amount: 230.0,
        dueDate: 'متأخرة منذ 3 أيام',
        isOverdue: true,
        icon: Icons.wifi,
      ),
      const BillItemData(
        title: 'اشتراك نتفليكس (Netflix)',
        amount: 45.0,
        dueDate: '10 نوفمبر 2026',
        isOverdue: false,
        icon: Icons.movie_filter,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'منبه الفواتير والاشتراكات',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withValues(alpha: 0.7),
        elevation: 2.0,
        shadowColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.onSurfaceVariant),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.containerMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top overdue alert card
            const BillAlertCard(),
            const SizedBox(height: 24.0),

            // Bills List
            Text(
              'الفواتير القادمة والاشتраكات',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppTheme.onSurface,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 12.0),

            ...bills.map((bill) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: BillListItem(bill: bill),
              );
            }),

            const SizedBox(height: 16.0),

            // Add Bill Button
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: AppTheme.primary),
              label: const Text('إضافة فاتورة/اشتراك جديد', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(56.0),
                side: const BorderSide(color: AppTheme.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BillItemData {
  final String title;
  final double amount;
  final String dueDate;
  final bool isOverdue;
  final IconData icon;

  const BillItemData({
    required this.title,
    required this.amount,
    required this.dueDate,
    required this.isOverdue,
    required this.icon,
  });
}
