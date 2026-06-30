import 'package:equatable/equatable.dart';
import '../../domain/entities/category_spend.dart';

abstract class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object?> get props => [];
}

class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}

class AnalyticsLoaded extends AnalyticsState {
  final List<CategorySpend> categories;

  const AnalyticsLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}
