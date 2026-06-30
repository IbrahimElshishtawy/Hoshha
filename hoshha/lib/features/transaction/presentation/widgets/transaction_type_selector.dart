import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class TransactionTypeSelector extends StatelessWidget {
  final String activeType;
  final ValueChanged<String> onTypeChanged;

  const TransactionTypeSelector({
    super.key,
    required this.activeType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          _buildSegmentButton(
            title: 'تحويل',
            type: 'transfer',
          ),
          _buildSegmentButton(
            title: 'دخل',
            type: 'income',
          ),
          _buildSegmentButton(
            title: 'مصروف',
            type: 'expense',
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentButton({required String title, required String type}) {
    final isSelected = activeType == type;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTypeChanged(type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? AppTheme.primary : AppTheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
