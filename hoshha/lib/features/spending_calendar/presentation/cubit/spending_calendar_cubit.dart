import 'package:flutter_bloc/flutter_bloc.dart';
import 'spending_calendar_state.dart';

class SpendingCalendarCubit extends Cubit<SpendingCalendarState> {
  SpendingCalendarCubit() : super(SpendingCalendarInitial());

  void loadCalendar(DateTime month) {
    emit(SpendingCalendarLoading());
    // Simulate loading data for the month
    emit(SpendingCalendarLoaded(
      currentMonth: month,
      selectedDate: DateTime.now(),
      events: const [], // empty for now
    ));
  }

  void selectDate(DateTime date) {
    if (state is SpendingCalendarLoaded) {
      final currentState = state as SpendingCalendarLoaded;
      emit(currentState.copyWith(selectedDate: date));
    }
  }

  void changeMonth(DateTime newMonth) {
    loadCalendar(newMonth);
  }
}
