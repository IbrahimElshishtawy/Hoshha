import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import 'package:hoshha/features/wallet/presentation/pages/wallet_management_page.dart';
import 'package:hoshha/features/analytics/presentation/pages/analytics_dashboard_page.dart';
import 'package:hoshha/features/savings_goals/presentation/pages/savings_goals_page.dart';
import 'package:hoshha/features/profile/presentation/pages/user_profile_page.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/ai_insight_card.dart';
import '../widgets/balance_card.dart';
import '../widgets/bento_widgets.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/quick_actions.dart';
import '../widgets/recent_transactions.dart';
import '../widgets/spending_chart.dart';
import '../widgets/summary_stats_row.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({super.key});

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()..loadHomeData(),
      child: Scaffold(
        appBar: _currentIndex == 0 ? const DashboardHeader() : null,
        body: Stack(
          children: [
            // Background decorations
            Positioned(
              top: 0,
              right: 0,
              width: 256.0,
              height: 256.0,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.primary.withValues(alpha: 0.04),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80.0,
              left: 0,
              width: 320.0,
              height: 320.0,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.secondary.withValues(alpha: 0.04),
                  ),
                ),
              ),
            ),

            // Stack switcher
            SafeArea(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  // Tab 0: Home Dashboard
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                          ),
                        );
                      }

                      if (state is HomeFailure) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'حدث خطأ: ${state.message}',
                                style: const TextStyle(color: AppTheme.error),
                              ),
                              const SizedBox(height: 16.0),
                              ElevatedButton(
                                onPressed: () => context.read<HomeCubit>().loadHomeData(),
                                child: const Text('إعادة المحاولة'),
                              ),
                            ],
                          ),
                        );
                      }

                      if (state is HomeLoaded) {
                        final data = state.homeData;

                        return SingleChildScrollView(
                          padding: const EdgeInsets.only(
                            left: AppTheme.containerMargin,
                            right: AppTheme.containerMargin,
                            top: 20.0,
                            bottom: 100.0, // Space for BottomNavBar
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Balance Card
                              BalanceCard(
                                balance: data.currentBalance,
                                trend: data.balanceTrend,
                              ),
                              const SizedBox(height: 24.0),

                              // Summary Stats Row
                              SummaryStatsRow(
                                income: data.income,
                                expenses: data.expenses,
                                savings: data.savings,
                              ),
                              const SizedBox(height: 16.0),

                              // Quick Actions Grid
                              const QuickActions(),
                              const SizedBox(height: 24.0),

                              // Bento Widgets
                              BentoWidgets(
                                healthScore: data.healthScore,
                                savingsGoalTitle: data.savingsGoalTitle,
                                savingsGoalCurrent: data.savingsGoalCurrent,
                                savingsGoalTarget: data.savingsGoalTarget,
                              ),
                              const SizedBox(height: 24.0),

                              // AI Insight Card
                              AiInsightCard(
                                insight: data.aiInsight,
                              ),
                              const SizedBox(height: 24.0),

                              // Spending Chart
                              const SpendingChart(),
                              const SizedBox(height: 24.0),

                              // Recent Transactions
                              RecentTransactions(
                                transactions: data.recentTransactions,
                              ),
                              const SizedBox(height: 24.0),
                            ],
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),

                  // Tab 1: Wallet Management
                  const WalletManagementPage(),

                  // Tab 2: Analytics Dashboard
                  const AnalyticsDashboardPage(),

                  // Tab 3: Savings Goals
                  const SavingsGoalsPage(),

                  // Tab 4: User Profile
                  const UserProfilePage(),
                ],
              ),
            ),

            // Glassmorphic Bottom Navigation Bar at the bottom of stack
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
        // Floating Action Button for Hawsha AI Assistant (sparkles)
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 76.0), // Above bottom navigation bar
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/ai_assistant');
            },
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.auto_awesome,
              size: 28.0,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
