import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class BudgetManagementPage extends StatelessWidget {
  const BudgetManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock budget limits
    final budgets = [
      const BudgetLimitData(
        categoryName: 'المطاعم والمقاهي',
        spent: 1200.0,
        limit: 1500.0,
        icon: Icons.restaurant,
      ),
      const BudgetLimitData(
        categoryName: 'السوبرماركت والمقاضي',
        spent: 1850.0,
        limit: 2000.0,
        icon: Icons.shopping_basket,
      ),
      const BudgetLimitData(
        categoryName: 'التسوق والتجزئة',
        spent: 980.0,
        limit: 1000.0,
        icon: Icons.shopping_bag,
      ),
      const BudgetLimitData(
        categoryName: 'الترفيه والأنشطة',
        spent: 420.0,
        limit: 300.0, // Exceeded!
        icon: Icons.sports_esports,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إدارة الميزانية والحدود',
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
            // Top overall warning summary
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppTheme.error.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                border: Border.all(color: AppTheme.error.withValues(alpha: 0.2)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: AppTheme.error, size: 28.0),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'تنبيه الميزانية اليومية',
                          style: TextStyle(
                            color: AppTheme.error,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'لقد تجاوزت حد ميزانية الترفيه لشهر أكتوبر بمقدار 120 ريال. ننصحك بتقليل نفقات الترفيه في الأيام القادمة.',
                          style: TextStyle(
                            color: AppTheme.onSurface,
                            fontSize: 11.0,
                            height: 1.4,
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

            // Active category limits
            Text(
              'حدود المصاريف الشهرية',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppTheme.onSurface,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 12.0),

            ...budgets.map((budget) {
              final ratio = budget.spent / budget.limit;
              final isExceeded = budget.spent > budget.limit;
              final isWarning = ratio >= 0.8 && !isExceeded;

              Color progressColor = AppTheme.primary;
              Color glowColor = Colors.transparent;

              if (isExceeded) {
                progressColor = AppTheme.error;
                glowColor = AppTheme.error.withValues(alpha: 0.1);
              } else if (isWarning) {
                progressColor = Colors.orange;
                glowColor = Colors.orange.withValues(alpha: 0.1);
              }

              return Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                  boxShadow: [
                    BoxShadow(
                      color: isExceeded || isWarning ? glowColor.withValues(alpha: 0.2) : Colors.black12,
                      blurRadius: 10.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: isExceeded || isWarning
                      ? Border.all(color: progressColor.withValues(alpha: 0.3), width: 1.0)
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المتبقي: ${(budget.limit - budget.spent).toStringAsFixed(0)} ريال',
                          style: TextStyle(
                            color: isExceeded ? AppTheme.error : AppTheme.onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              budget.categoryName,
                              style: const TextStyle(
                                color: AppTheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Icon(budget.icon, color: progressColor),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${budget.spent.toStringAsFixed(0)} ريال مصاريف',
                          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'الحد الأقصى: ${budget.limit.toStringAsFixed(0)} ريال',
                          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                      child: LinearProgressIndicator(
                        value: ratio > 1.0 ? 1.0 : ratio,
                        minHeight: 10.0,
                        backgroundColor: AppTheme.surfaceVariant,
                        valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 16.0),

            // Edit Budgets Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                minimumSize: const Size.fromHeight(56.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                ),
              ),
              child: const Text(
                'تعديل حدود الميزانية',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetLimitData {
  final String categoryName;
  final double spent;
  final double limit;
  final IconData icon;

  const BudgetLimitData({
    required this.categoryName,
    required this.spent,
    required this.limit,
    required this.icon,
  });
}
