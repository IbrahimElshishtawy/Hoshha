import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Add Expense Button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/add_transaction');
            },
            icon: const Icon(Icons.remove_circle_outline, color: AppTheme.onSurface),
            label: Text(
              'إضافة مصروف',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppTheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.surfaceContainerHighest,
              foregroundColor: AppTheme.onSurface,
              elevation: 0,
              minimumSize: const Size.fromHeight(56.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        // Add Income Button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/add_transaction');
            },
            icon: const Icon(Icons.add_circle_outline, color: Colors.white),
            label: Text(
              'إضافة دخل',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              elevation: 4.0,
              shadowColor: AppTheme.primary.withValues(alpha: 0.2),
              minimumSize: const Size.fromHeight(56.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
