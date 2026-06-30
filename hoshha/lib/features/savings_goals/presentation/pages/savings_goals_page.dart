import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/goal_progress_card.dart';

class SavingsGoalsPage extends StatelessWidget {
  const SavingsGoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock savings goals
    final goals = [
      const GoalData(
        title: 'شراء سيارة جديدة',
        current: 45000.0,
        target: 120000.0,
        deadline: 'ديسمبر 2027',
      ),
      const GoalData(
        title: 'سفرية ماليزيا',
        current: 8500.0,
        target: 10000.0,
        deadline: 'نوفمبر 2026',
      ),
      const GoalData(
        title: 'صندوق الطوارئ',
        current: 15000.0,
        target: 20000.0,
        deadline: 'أبريل 2027',
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
            // Total Savings overview card
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.primary, AppTheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.3),
                    blurRadius: 20.0,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'إجمالي رصيد الادخار',
                    style: TextStyle(color: Colors.white70, fontSize: 12.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '68,500 ريال',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'لقد ادخرت 4,200 ريال إضافية هذا الشهر! استمر في التقدم المذهل.',
                    style: TextStyle(color: Colors.white70, fontSize: 11.0),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28.0),

            // Goals list header
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
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GoalProgressCard(goal: goal),
              );
            }),

            const SizedBox(height: 16.0),

            // Add Goal Button
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
                'إضافة هدف ادخار جديد',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

  const GoalData({
    required this.title,
    required this.current,
    required this.target,
    required this.deadline,
  });
}
