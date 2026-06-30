import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubit/spending_calendar_cubit.dart';
import '../cubit/spending_calendar_state.dart';
import 'widgets/calendar_widget.dart';
import '../../../transaction/presentation/widgets/transaction_history_list.dart';

class SpendingCalendarPage extends StatefulWidget {
  const SpendingCalendarPage({super.key});

  @override
  State<SpendingCalendarPage> createState() => _SpendingCalendarPageState();
}

class _SpendingCalendarPageState extends State<SpendingCalendarPage> {
  @override
  void initState() {
    super.initState();
    context.read<SpendingCalendarCubit>().loadCalendar(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('تقويم المصروفات', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month),
            label: Text(DateFormat('MMMM yyyy', 'ar').format(DateTime.now())),
          ),
        ],
      ),
      body: BlocBuilder<SpendingCalendarCubit, SpendingCalendarState>(
        builder: (context, state) {
          if (state is SpendingCalendarLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SpendingCalendarLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CalendarWidget(
                    currentMonth: state.currentMonth,
                    selectedDate: state.selectedDate,
                    events: state.events,
                    onDateSelected: (date) {
                      context.read<SpendingCalendarCubit>().selectDate(date);
                    },
                  ),
                  const SizedBox(height: 24),
                  // Daily Summary
                  _buildDailySummary(context, state),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildDailySummary(BuildContext context, SpendingCalendarLoaded state) {
    final formatter = NumberFormat.currency(symbol: 'ريال', decimalDigits: 2, customPattern: '\u00a4 #,##0.00');
    final dateStr = DateFormat('dd MMMM', 'ar').format(state.selectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ملخص يوم $dateStr',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الدخل', style: TextStyle(color: Colors.green.shade700, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(
                      formatter.format(12000), // Mock
                      style: TextStyle(color: Colors.green.shade700, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('المنصرف', style: TextStyle(color: Colors.red.shade700, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(
                      formatter.format(250), // Mock
                      style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        TransactionHistoryList(
          title: 'المعاملات',
          transactions: const [], // Mock empty for now
        ),
      ],
    );
  }
}
