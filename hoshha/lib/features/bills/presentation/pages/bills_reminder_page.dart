import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../cubit/bills_cubit.dart';
import '../cubit/bills_state.dart';
import '../widgets/bill_alert_card.dart';
import '../widgets/bill_list_item.dart';

class BillsReminderPage extends StatelessWidget {
  const BillsReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => sl<BillsCubit>()..loadBills(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'منبه الفواتير والاشتراكات',
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
        body: BlocBuilder<BillsCubit, BillsState>(
          builder: (context, state) {
            if (state is BillsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                ),
              );
            }

            if (state is BillsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.containerMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Top overdue alert card
                    const BillAlertCard(),
                    const SizedBox(height: 24.0),

                    // Bills List
                    Text(
                      'الفواتير القادمة والاشتراكات',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppTheme.onSurface,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 12.0),

                    ...state.bills.map((bill) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: BillListItem(bill: bill),
                      );
                    }),

                    const SizedBox(height: 16.0),

                    // Add Bill Button
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: AppTheme.primary),
                      label: const Text('إضافة فاتورة/اشتراك جديد', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56.0),
                        side: const BorderSide(color: AppTheme.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
