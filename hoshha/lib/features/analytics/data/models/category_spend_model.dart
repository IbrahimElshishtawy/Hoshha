import 'package:flutter/material.dart';
import '../../../../core/utils/icon_helper.dart';
import '../../domain/entities/category_spend.dart';

class CategorySpendModel extends CategorySpend {
  const CategorySpendModel({
    required super.name,
    required super.spent,
    required super.limit,
    required super.color,
    required super.icon,
  });

  factory CategorySpendModel.fromJson(Map<String, dynamic> json) {
    return CategorySpendModel(
      name: json['name'] as String,
      spent: (json['spent'] as num).toDouble(),
      limit: (json['limit'] as num).toDouble(),
      color: Color(json['colorValue'] as int),
      icon: IconHelper.getIcon(json['iconKey'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'spent': spent,
      'limit': limit,
      'colorValue': color.toARGB32(),
      'iconKey': IconHelper.getKey(icon),
    };
  }
}
