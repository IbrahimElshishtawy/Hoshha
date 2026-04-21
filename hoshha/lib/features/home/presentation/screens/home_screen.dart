import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';

import '../../../../app/router/app_router.dart';
import '../../../../theme/theme_extensions.dart';
import '../widgets/home_budget_summary_section.dart';
import '../widgets/home_gamification_summary_section.dart';
import '../widgets/home_header.dart';
import '../widgets/home_recent_expenses_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final spacing = context.appSpacing;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoutes.addExpense),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.homePrimaryActionAddExpense),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsetsDirectional.only(
                    start: spacing.lg,
                    top: spacing.lg,
                    end: spacing.lg,
                    bottom: spacing.xl + 96,
                  ),
                  sliver: SliverList.list(
                    children: [
                      const HomeHeader(),
                      SizedBox(height: spacing.lg),
                      HomeBudgetSummarySection(
                        onBudgetActionPressed: () =>
                            _showUnavailableMessage(context),
                      ),
                      SizedBox(height: spacing.lg),
                      const HomeGamificationSummarySection(),
                      SizedBox(height: spacing.lg),
                      HomeRecentExpensesSection(
                        onAddExpensePressed: () =>
                            context.push(AppRoutes.addExpense),
                        onSeeAllPressed: () => context.push(AppRoutes.history),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showUnavailableMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(l10n.homeComingSoonMessage)));
  }
}
