import '../../../../core/utils/icon_helper.dart';
import '../../domain/entities/budget_limit.dart';

class BudgetLimitModel extends BudgetLimit {
  const BudgetLimitModel({
    required super.categoryName,
    required super.spent,
    required super.limit,
    required super.icon,
  });

  factory BudgetLimitModel.fromJson(Map<String, dynamic> json) {
    return BudgetLimitModel(
      categoryName: json['categoryName'] as String,
      spent: (json['spent'] as num).toDouble(),
      limit: (json['limit'] as num).toDouble(),
      icon: IconHelper.getIcon(json['iconKey'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'spent': spent,
      'limit': limit,
      'iconKey': IconHelper.getKey(icon),
    };
  }
}
