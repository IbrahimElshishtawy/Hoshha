import 'package:equatable/equatable.dart';
import '../../domain/entities/bill.dart';

abstract class BillsState extends Equatable {
  const BillsState();

  @override
  List<Object?> get props => [];
}

class BillsInitial extends BillsState {}

class BillsLoading extends BillsState {}

class BillsLoaded extends BillsState {
  final List<Bill> bills;

  const BillsLoaded({required this.bills});

  @override
  List<Object?> get props => [bills];
}
