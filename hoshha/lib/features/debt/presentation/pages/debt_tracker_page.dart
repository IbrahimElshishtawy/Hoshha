import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../cubit/debt_cubit.dart';
import '../cubit/debt_state.dart';
import '../widgets/debt_list_item.dart';
import '../widgets/debt_summary_card.dart';

class DebtTrackerPage extends StatefulWidget {
  const DebtTrackerPage({super.key});

  @override
  State<DebtTrackerPage> createState() => _DebtTrackerPageState();
}

class _DebtTrackerPageState extends State<DebtTrackerPage> {
  String _activeTab = 'owe'; // 'owe' (عليّ), 'owed' (لي)

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => sl<DebtCubit>()..loadDebts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'مجدول الديون',
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
        body: BlocBuilder<DebtCubit, DebtState>(
          builder: (context, state) {
            if (state is DebtLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                ),
              );
            }

            if (state is DebtLoaded) {
              final activeList = _activeTab == 'owe' ? state.debtsOwedToOthers : state.debtsOwedToMe;

              return Column(
                children: [
                  // Segmented Tabs
                  Padding(
                    padding: const EdgeInsets.all(AppTheme.containerMargin),
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        children: [
                          _buildTabButton(
                            title: 'ديون لي (مستحقات)',
                            tabKey: 'owed',
                          ),
                          _buildTabButton(
                            title: 'ديون عليّ (التزامات)',
                            tabKey: 'owe',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Total indicator card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
                    child: DebtSummaryCard(activeTab: _activeTab),
                  ),
                  const SizedBox(height: 16.0),

                  // Debt List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
                      itemCount: activeList.length,
                      itemBuilder: (context, index) {
                        final debt = activeList[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: DebtListItem(
                            debt: debt,
                            activeTab: _activeTab,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppTheme.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTabButton({required String title, required String tabKey}) {
    final isSelected = _activeTab == tabKey;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _activeTab = tabKey),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? AppTheme.primary : AppTheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
