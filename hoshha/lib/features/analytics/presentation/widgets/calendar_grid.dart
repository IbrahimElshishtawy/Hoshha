import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CalendarGrid extends StatelessWidget {
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  const CalendarGrid({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          // Week Days Names
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('ح', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.outline)),
              Text('n', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.outline)),
              Text('ث', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.outline)),
              Text('ر', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.outline)),
              Text('خ', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.outline)),
              Text('ج', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.outline)),
              Text('س', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.outline)),
            ],
          ),
          const SizedBox(height: 12.0),
          // Days Grid (Mocking a 5-week month starting on Thursday)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: 35, // 4 empty + 31 days
            itemBuilder: (context, index) {
              final dayNumber = index - 3; // Starts at Thursday (index 4 is 1st October)
              if (dayNumber <= 0 || dayNumber > 31) {
                return const SizedBox.shrink();
              }

              final isSelected = dayNumber == selectedDay;

              // Simulated markers: days 24, 25 have indicators
              final hasExpense = dayNumber == 24 || dayNumber == 10 || dayNumber == 15;
              final hasIncome = dayNumber == 25 || dayNumber == 1;

              return GestureDetector(
                onTap: () => onDaySelected(dayNumber),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.primary : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$dayNumber',
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppTheme.onSurface,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      if (!isSelected && (hasExpense || hasIncome))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (hasExpense)
                              Container(
                                width: 4.0,
                                height: 4.0,
                                decoration: const BoxDecoration(
                                  color: AppTheme.error,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (hasExpense && hasIncome) const SizedBox(width: 2.0),
                            if (hasIncome)
                              Container(
                                width: 4.0,
                                height: 4.0,
                                decoration: const BoxDecoration(
                                  color: AppTheme.secondary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
