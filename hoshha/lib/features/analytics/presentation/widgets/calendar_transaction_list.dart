import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../pages/spending_calendar_page.dart';

class CalendarTransactionList extends StatelessWidget {
  final List<CalendarTxData> transactions;

  const CalendarTransactionList({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text('لا توجد معاملات في هذا اليوم'),
        ),
      );
    }

    return Column(
      children: transactions.map((tx) {
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
      }).toList(),
    );
  }
}
