import 'package:equatable/equatable.dart';
import '../../domain/entities/financial_report.dart';

abstract class FinancialReportsState extends Equatable {
  const FinancialReportsState();

  @override
  List<Object?> get props => [];
}

class FinancialReportsInitial extends FinancialReportsState {}

class FinancialReportsLoading extends FinancialReportsState {}

class FinancialReportsLoaded extends FinancialReportsState {
  final FinancialReport report;

  const FinancialReportsLoaded(this.report);

  @override
  List<Object?> get props => [report];
}

class FinancialReportsError extends FinancialReportsState {
  final String message;

  const FinancialReportsError(this.message);

  @override
  List<Object?> get props => [message];
}
