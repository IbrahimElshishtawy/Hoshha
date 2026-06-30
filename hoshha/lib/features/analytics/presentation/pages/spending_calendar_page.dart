import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

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

            // Grid Calendar View (Mocking the month of October)
            Container(
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
                      Text('ن', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.outline)),
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

                      final isSelected = dayNumber == _selectedDay;

                      // Simulated markers: days 24, 25 have indicators
                      final hasExpense = dayNumber == 24 || dayNumber == 10 || dayNumber == 15;
                      final hasIncome = dayNumber == 25 || dayNumber == 1;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDay = dayNumber;
                          });
                        },
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

            if (transactions.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text('لا توجد معاملات في هذا اليوم'),
                ),
              )
            else
              ...transactions.map((tx) {
                final isIncome = tx.type == 'income';

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${isIncome ? "+" : "-"}${tx.amount.toStringAsFixed(0)} ريال',
                        style: TextStyle(
                          color: isIncome ? AppTheme.secondary : AppTheme.error,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            tx.title,
                            style: const TextStyle(
                              color: AppTheme.onSurface,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            tx.time,
                            style: const TextStyle(
                              color: AppTheme.onSurfaceVariant,
                              fontSize: 11.0,
                            ),
                          ),
                        ],
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
