import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../cubit/savings_goals_cubit.dart';
import '../cubit/savings_goals_state.dart';
import '../widgets/goal_progress_card.dart';

class SavingsGoalsPage extends StatelessWidget {
  const SavingsGoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => sl<SavingsGoalsCubit>()..loadGoals(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'أهداف الادخار',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppTheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white.withValues(alpha: 0.7),
          elevation: 2.0,
          shadowColor: Colors.black12,
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<SavingsGoalsCubit, SavingsGoalsState>(
          builder: (context, state) {
            if (state is SavingsGoalsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                ),
              );
            }

            if (state is SavingsGoalsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.containerMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Total Savings overview card
                    Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppTheme.primary, AppTheme.secondary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withValues(alpha: 0.3),
                            blurRadius: 20.0,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'إجمالي رصيد الادخار',
                            style: TextStyle(color: Colors.white70, fontSize: 12.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '${state.totalSavings.toStringAsFixed(0)} ريال',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          const Text(
                            'لقد ادخرت 4,200 ريال إضافية هذا الشهر! استمر في التقدم المذهل.',
                            style: TextStyle(color: Colors.white70, fontSize: 11.0),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28.0),

                    // Goals list header
                    Text(
                      'أهدافك النشطة',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppTheme.onSurface,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 12.0),

                    ...state.goals.map((goal) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GoalProgressCard(goal: goal),
                      );
                    }),

                    const SizedBox(height: 16.0),

                    // Add Goal Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        minimumSize: const Size.fromHeight(56.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                        ),
                      ),
                      child: const Text(
                        'إضافة هدف ادخار جديد',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
