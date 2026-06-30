import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class TransactionQuickActions extends StatelessWidget {
  const TransactionQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuickActionButton(
          icon: Icons.location_on,
          label: 'الموقع',
        ),
        const SizedBox(width: 16.0),
        _buildQuickActionButton(
          icon: Icons.photo_camera,
          label: 'إرفاق إيصال',
        ),
        const SizedBox(width: 16.0),
        _buildQuickActionButton(
          icon: Icons.mic,
          label: 'إدخال صوتي',
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({required IconData icon, required String label}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(AppTheme.radiusCard),
          border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.onSurfaceVariant),
            const SizedBox(height: 6.0),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.onSurfaceVariant,
                fontSize: 11.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
