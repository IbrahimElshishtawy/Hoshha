import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BudgetLimit extends Equatable {
  final String categoryName;
  final double spent;
  final double limit;
  final IconData icon;

  const BudgetLimit({
    required this.categoryName,
    required this.spent,
    required this.limit,
    required this.icon,
  });

  @override
  List<Object?> get props => [categoryName, spent, limit, icon];
}
