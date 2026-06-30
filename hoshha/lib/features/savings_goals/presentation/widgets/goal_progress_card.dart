import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../pages/savings_goals_page.dart';

class GoalProgressCard extends StatelessWidget {
  final GoalData goal;

  const GoalProgressCard({
    super.key,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ratio = goal.current / goal.target;

    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Radial progress ring on the left
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 60.0,
                height: 60.0,
                child: CircularProgressIndicator(
                  value: ratio,
                  strokeWidth: 6.0,
                  backgroundColor: AppTheme.surfaceVariant,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primary),
                ),
              ),
              Text(
                '${(ratio * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
          // Goal details on the right
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                goal.title,
                style: const TextStyle(
                  color: AppTheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'المستهدف: ${goal.target.toStringAsFixed(0)} ريال',
                style: const TextStyle(
                  color: AppTheme.onSurfaceVariant,
                  fontSize: 11.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'المدخر الحالي: ${goal.current.toStringAsFixed(0)} ريال',
                style: const TextStyle(
                  color: AppTheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'الهدف بحلول: ${goal.deadline}',
                style: const TextStyle(
                  color: AppTheme.outline,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
