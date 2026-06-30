import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
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
    return Scaffold(
      appBar: const DashboardHeader(),
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
                  color: AppTheme.primary.withOpacity(0.04),
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
                  color: AppTheme.secondary.withOpacity(0.04),
                ),
              ),
            ),
          ),

          // Scrollable body
          SafeArea(
            child: SingleChildScrollView(
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
                  const BalanceCard(),
                  const SizedBox(height: 24.0),

                  // Summary Stats Row
                  const SummaryStatsRow(),
                  const SizedBox(height: 16.0),

                  // Quick Actions Grid
                  const QuickActions(),
                  const SizedBox(height: 24.0),

                  // Bento Widgets
                  const BentoWidgets(),
                  const SizedBox(height: 24.0),

                  // AI Insight Card
                  const AiInsightCard(),
                  const SizedBox(height: 24.0),

                  // Spending Chart
                  const SpendingChart(),
                  const SizedBox(height: 24.0),

                  // Recent Transactions
                  const RecentTransactions(),
                  const SizedBox(height: 24.0),
                ],
              ),
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
                if (index == 2) {
                  // E.g. Navigate to analytics
                }
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
      // In RTL, Floating Action Button floats on bottom-left, which is perfect!
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
