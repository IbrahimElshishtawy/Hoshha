import 'package:flutter/material.dart';
import '../../domain/entities/calendar_event.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime currentMonth;
  final DateTime selectedDate;
  final List<CalendarEvent> events;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarWidget({
    super.key,
    required this.currentMonth,
    required this.selectedDate,
    required this.events,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Basic calendar implementation
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDaysHeader(context),
          const SizedBox(height: 8),
          _buildGrid(context),
        ],
      ),
    );
  }

  Widget _buildDaysHeader(BuildContext context) {
    const days = ['أحد', 'اثنين', 'ثلاثاء', 'أربعاء', 'خميس', 'جمعة', 'سبت'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((d) => Text(d, style: TextStyle(color: Theme.of(context).colorScheme.outline, fontSize: 12))).toList(),
    );
  }

  Widget _buildGrid(BuildContext context) {
    // Simplistic mock grid (1..30)
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.0,
      ),
      itemCount: 30, // Mock 30 days
      itemBuilder: (context, index) {
        final day = index + 1;
        final isSelected = day == selectedDate.day;
        
        return GestureDetector(
          onTap: () {
            onDateSelected(DateTime(currentMonth.year, currentMonth.month, day));
          },
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2) : Colors.transparent,
              shape: BoxShape.circle,
              border: isSelected ? Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.2)) : null,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$day',
                    style: TextStyle(
                      color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (day % 3 == 0) // Mock dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
                        const SizedBox(width: 2),
                        Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
