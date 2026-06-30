import 'package:equatable/equatable.dart';
import '../../domain/entities/calendar_event.dart';

abstract class SpendingCalendarState extends Equatable {
  const SpendingCalendarState();

  @override
  List<Object?> get props => [];
}

class SpendingCalendarInitial extends SpendingCalendarState {}

class SpendingCalendarLoading extends SpendingCalendarState {}

class SpendingCalendarLoaded extends SpendingCalendarState {
  final DateTime currentMonth;
  final DateTime selectedDate;
  final List<CalendarEvent> events; // monthly events

  const SpendingCalendarLoaded({
    required this.currentMonth,
    required this.selectedDate,
    required this.events,
  });

  @override
  List<Object?> get props => [currentMonth, selectedDate, events];

  SpendingCalendarLoaded copyWith({
    DateTime? currentMonth,
    DateTime? selectedDate,
    List<CalendarEvent>? events,
  }) {
    return SpendingCalendarLoaded(
      currentMonth: currentMonth ?? this.currentMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      events: events ?? this.events,
    );
  }
}

class SpendingCalendarError extends SpendingCalendarState {
  final String message;

  const SpendingCalendarError(this.message);

  @override
  List<Object?> get props => [message];
}
