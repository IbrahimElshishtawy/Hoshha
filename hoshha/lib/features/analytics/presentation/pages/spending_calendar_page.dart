import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/calendar_grid.dart';
import '../widgets/calendar_transaction_list.dart';

class SpendingCalendarPage extends StatefulWidget {
  const SpendingCalendarPage({super.key});

  @override
  State<SpendingCalendarPage> createState() => _SpendingCalendarPageState();
}

class _SpendingCalendarPageState extends State<SpendingCalendarPage> {
  int _selectedDay = 24;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock transactions on the selected day
    final transactions = [
      const CalendarTxData(
        title: 'بنزين المحطة',
        amount: 80.0,
        type: 'expense',
        time: '4:15 م',
      ),
      const CalendarTxData(
        title: 'أمازون شحن كود',
        amount: 120.0,
        type: 'expense',
        time: '1:00 م',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تقويم الإنفاق',
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
            // Calendar Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {},
                ),
                Text(
                  'أكتوبر 2026',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Grid Calendar View
            CalendarGrid(
              selectedDay: _selectedDay,
              onDaySelected: (day) {
                setState(() {
                  _selectedDay = day;
                });
              },
            ),
            const SizedBox(height: 24.0),

            // Transactions list for the selected day
            Text(
              'معاملات يوم $_selectedDay أكتوبر',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppTheme.onSurface,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 12.0),

            CalendarTransactionList(transactions: transactions),
          ],
        ),
      ),
    );
  }
}

class CalendarTxData {
  final String title;
  final double amount;
  final String type;
  final String time;

  const CalendarTxData({
    required this.title,
    required this.amount,
    required this.type,
    required this.time,
  });
}
