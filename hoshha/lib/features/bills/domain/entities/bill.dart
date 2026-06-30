import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Bill extends Equatable {
  final String title;
  final double amount;
  final String dueDate;
  final bool isOverdue;
  final IconData icon;

  const Bill({
    required this.title,
    required this.amount,
    required this.dueDate,
    required this.isOverdue,
    required this.icon,
  });

  @override
  List<Object?> get props => [title, amount, dueDate, isOverdue, icon];
}
