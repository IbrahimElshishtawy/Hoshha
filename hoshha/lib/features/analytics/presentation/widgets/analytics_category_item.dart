import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/category_spend.dart';

class AnalyticsCategoryItem extends StatelessWidget {
  final CategorySpend category;

  const AnalyticsCategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final isExceeded = category.spent > category.limit;
    final percent = category.spent / category.limit;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${category.spent.toStringAsFixed(0)} / ${category.limit.toStringAsFixed(0)} ريال',
                style: TextStyle(
                  color: isExceeded ? AppTheme.error : AppTheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                ),
              ),
              Row(
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(
                      color: AppTheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: category.color.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      category.icon,
                      color: category.color,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
            child: LinearProgressIndicator(
              value: percent > 1.0 ? 1.0 : percent,
              minHeight: 8.0,
              backgroundColor: AppTheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(
                isExceeded ? AppTheme.error : category.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
