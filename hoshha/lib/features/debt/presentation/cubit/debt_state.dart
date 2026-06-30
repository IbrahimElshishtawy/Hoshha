import 'package:equatable/equatable.dart';
import '../../domain/entities/debt_item.dart';

abstract class DebtState extends Equatable {
  const DebtState();

  @override
  List<Object?> get props => [];
}

class DebtInitial extends DebtState {}

class DebtLoading extends DebtState {}

class DebtLoaded extends DebtState {
  final List<DebtItem> debtsOwedToOthers;
  final List<DebtItem> debtsOwedToMe;

  const DebtLoaded({
    required this.debtsOwedToOthers,
    required this.debtsOwedToMe,
  });

  @override
  List<Object?> get props => [debtsOwedToOthers, debtsOwedToMe];
}
