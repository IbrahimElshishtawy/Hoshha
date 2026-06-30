import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AnalyticsDashboardPage extends StatelessWidget {
  const AnalyticsDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock data for categories
    final categories = [
      const CategorySpendData(
        name: 'الطعام والمطاعم',
        spent: 1200.0,
        limit: 1500.0,
        color: AppTheme.primary,
        icon: Icons.restaurant,
      ),
      const CategorySpendData(
        name: 'التسوق والملابس',
        spent: 950.0,
        limit: 1200.0,
        color: AppTheme.secondary,
        icon: Icons.shopping_bag,
      ),
      const CategorySpendData(
        name: 'المواصلات والوقود',
        spent: 500.0,
        limit: 600.0,
        color: AppTheme.tertiary,
        icon: Icons.directions_car,
      ),
      const CategorySpendData(
        name: 'الترفيه والألعاب',
        spent: 350.0,
        limit: 300.0, // Exceeded!
        color: AppTheme.error,
        icon: Icons.sports_esports,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التحليلات المالية',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withValues(alpha: 0.7),
        elevation: 2.0,
        shadowColor: Colors.black12,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.containerMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Month selector and calendar trigger
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/calendar'),
                  icon: const Icon(Icons.calendar_month, color: AppTheme.primary),
                  label: const Text('تقويم المصاريف', style: TextStyle(color: AppTheme.primary)),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    side: const BorderSide(color: AppTheme.outlineVariant),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.chevron_left, color: AppTheme.onSurfaceVariant),
                    const SizedBox(width: 8.0),
                    Text(
                      'أكتوبر 2026',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppTheme.onSurface,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(Icons.chevron_right, color: AppTheme.onSurfaceVariant),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // Spend breakdown chart card
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'توزيع المصاريف حسب التصنيف',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: AppTheme.onSurface,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  // Mock radial chart
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: CircularProgressIndicator(
                          value: 0.75,
                          strokeWidth: 16.0,
                          backgroundColor: AppTheme.surfaceVariant,
                          valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primary),
                        ),
                      ),
                      SizedBox(
                        width: 108,
                        height: 108,
                        child: CircularProgressIndicator(
                          value: 0.58,
                          strokeWidth: 12.0,
                          backgroundColor: AppTheme.surfaceVariant,
                          valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.secondary),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'المجموع',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppTheme.onSurfaceVariant,
                            ),
                          ),
                          const Text(
                            '3,000 ريال',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Category detail list
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/budget'),
                  child: const Text('إدارة الميزانية', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
                ),
                Text(
                  'تفاصيل التصنيفات والميزانية',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppTheme.onSurface,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            ...categories.map((cat) {
              final isExceeded = cat.spent > cat.limit;
              final percent = cat.spent / cat.limit;

              return Container(
                margin: const EdgeInsets.only(bottom: 12.0),
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${cat.spent.toStringAsFixed(0)} / ${cat.limit.toStringAsFixed(0)} ريال',
                          style: TextStyle(
                            color: isExceeded ? AppTheme.error : AppTheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              cat.name,
                              style: const TextStyle(
                                color: AppTheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Container(
                              width: 36.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: cat.color.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                cat.icon,
                                color: cat.color,
                                size: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                      child: LinearProgressIndicator(
                        value: percent > 1.0 ? 1.0 : percent,
                        minHeight: 8.0,
                        backgroundColor: AppTheme.surfaceVariant,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isExceeded ? AppTheme.error : cat.color,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CategorySpendData {
  final String name;
  final double spent;
  final double limit;
  final Color color;
  final IconData icon;

  const CategorySpendData({
    required this.name,
    required this.spent,
    required this.limit,
    required this.color,
    required this.icon,
  });
}
