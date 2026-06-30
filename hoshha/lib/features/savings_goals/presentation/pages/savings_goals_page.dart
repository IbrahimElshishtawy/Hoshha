import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SavingsGoalsPage extends StatelessWidget {
  const SavingsGoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock savings goals data
    final goals = [
      const GoalData(
        title: 'شراء سيارة جديدة',
        current: 75000.0,
        target: 120000.0,
        deadline: 'ديسمبر 2026',
        color: AppTheme.primary,
        icon: Icons.directions_car,
      ),
      const GoalData(
        title: 'رحلة الصيف العائلية',
        current: 12000.0,
        target: 15000.0,
        deadline: 'أغسطس 2026',
        color: AppTheme.secondary,
        icon: Icons.flight,
      ),
      const GoalData(
        title: 'صندوق الطوارئ',
        current: 5000.0,
        target: 20000.0,
        deadline: 'يونيو 2027',
        color: AppTheme.tertiary,
        icon: Icons.health_and_safety,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'أهداف الادخار',
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
            // Top Summary
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppTheme.primaryContainer.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                border: Border.all(color: AppTheme.primaryContainer.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '92,000 ريال',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'إجمالي ما تم ادخاره',
                        style: TextStyle(
                          color: AppTheme.onSurfaceVariant,
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.insights,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Active Goals List
            Text(
              'أهدافك النشطة',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppTheme.onSurface,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 12.0),

            ...goals.map((goal) {
              final ratio = goal.current / goal.target;
              final percent = (ratio * 100).toStringAsFixed(0);

              return Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(20.0),
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
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: goal.color.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            goal.icon,
                            color: goal.color,
                            size: 24.0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              goal.title,
                              style: const TextStyle(
                                color: AppTheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              'المستهدف: ${goal.deadline}',
                              style: const TextStyle(
                                color: AppTheme.onSurfaceVariant,
                                fontSize: 11.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${goal.current.toStringAsFixed(0)} / ${goal.target.toStringAsFixed(0)} ريال',
                          style: const TextStyle(
                            color: AppTheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          'نجاح $percent%',
                          style: TextStyle(
                            color: goal.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                      child: LinearProgressIndicator(
                        value: ratio,
                        minHeight: 10.0,
                        backgroundColor: AppTheme.surfaceVariant,
                        valueColor: AlwaysStoppedAnimation<Color>(goal.color),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 16.0),

            // Add Goal Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('إضافة هدف جديد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                minimumSize: const Size.fromHeight(56.0),
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

class GoalData {
  final String title;
  final double current;
  final double target;
  final String deadline;
  final Color color;
  final IconData icon;

  const GoalData({
    required this.title,
    required this.current,
    required this.target,
    required this.deadline,
    required this.color,
    required this.icon,
  });
}
