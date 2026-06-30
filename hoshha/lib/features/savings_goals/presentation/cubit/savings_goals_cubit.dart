import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/savings_goal.dart';
import 'savings_goals_state.dart';

class SavingsGoalsCubit extends Cubit<SavingsGoalsState> {
  SavingsGoalsCubit() : super(SavingsGoalsInitial());

  void loadGoals() {
    emit(SavingsGoalsLoading());

    // Mock load
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(const SavingsGoalsLoaded(
        goals: [
          SavingsGoal(
            title: 'شراء سيارة جديدة',
            current: 45000.0,
            target: 120000.0,
            deadline: 'ديسمبر 2027',
          ),
          SavingsGoal(
            title: 'سفرية ماليزيا',
            current: 8500.0,
            target: 10000.0,
            deadline: 'نوفمبر 2026',
          ),
          SavingsGoal(
            title: 'صندوق الطوارئ',
            current: 15000.0,
            target: 20000.0,
            deadline: 'أبريل 2027',
          ),
        ],
        totalSavings: 68500.0,
      ));
    });
  }
}
