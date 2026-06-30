import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/budget_limit_card.dart';

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
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: BudgetLimitCard(budget: budget),
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
