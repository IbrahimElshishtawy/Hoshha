import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategorySpend extends Equatable {
  final String name;
  final double spent;
  final double limit;
  final Color color;
  final IconData icon;

  const CategorySpend({
    required this.name,
    required this.spent,
    required this.limit,
    required this.color,
    required this.icon,
  });

  @override
  List<Object?> get props => [name, spent, limit, color, icon];
}
