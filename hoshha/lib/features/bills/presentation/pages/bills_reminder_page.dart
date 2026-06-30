import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

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
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppTheme.error.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                border: Border.all(color: AppTheme.error.withValues(alpha: 0.2)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.notifications_active, color: AppTheme.error, size: 28.0),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'فواتير متأخرة الدفع',
                          style: TextStyle(
                            color: AppTheme.error,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'لديك فاتورة إنترنت منزلية متأخرة الدفع منذ 3 أيام بمبلغ 230 ريال. يرجى سدادها لتجنب انقطاع الخدمة.',
                          style: TextStyle(
                            color: AppTheme.onSurface,
                            fontSize: 11.0,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Bills List
            Text(
              'الفواتير القادمة والاشتراكات',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppTheme.onSurface,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 12.0),

            ...bills.map((bill) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  border: bill.isOverdue
                      ? Border.all(color: AppTheme.error.withValues(alpha: 0.3), width: 1.0)
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Pay Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bill.isOverdue ? AppTheme.error : AppTheme.primary,
                        minimumSize: const Size(80, 36),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: const Text(
                        'ادفع الآن',
                        style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Details
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              bill.title,
                              style: const TextStyle(
                                color: AppTheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              bill.dueDate,
                              style: TextStyle(
                                color: bill.isOverdue ? AppTheme.error : AppTheme.onSurfaceVariant,
                                fontSize: 11.0,
                                fontWeight: bill.isOverdue ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '${bill.amount.toStringAsFixed(0)} ريال',
                              style: const TextStyle(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16.0),
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: (bill.isOverdue ? AppTheme.error : AppTheme.primary).withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            bill.icon,
                            color: bill.isOverdue ? AppTheme.error : AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
