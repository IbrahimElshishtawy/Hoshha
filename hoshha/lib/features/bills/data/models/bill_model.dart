import 'package:flutter/material.dart';
import '../../domain/entities/bill.dart';

class BillModel extends Bill {
  const BillModel({
    required super.title,
    required super.amount,
    required super.dueDate,
    required super.isOverdue,
    required super.icon,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      dueDate: json['dueDate'] as String,
      isOverdue: json['isOverdue'] as bool,
      icon: IconData(
        json['iconCodePoint'] as int,
        fontFamily: json['iconFontFamily'] as String? ?? 'MaterialIcons',
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
      'dueDate': dueDate,
      'isOverdue': isOverdue,
      'iconCodePoint': icon.codePoint,
      'iconFontFamily': icon.fontFamily,
    };
  }
}
