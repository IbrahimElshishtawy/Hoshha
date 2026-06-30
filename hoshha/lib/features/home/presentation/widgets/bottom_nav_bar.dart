import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 4.0,
        top: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.person_outline,
            label: 'الملف الشخصي',
            index: 4,
            context: context,
          ),
          _buildNavItem(
            icon: Icons.track_changes,
            label: 'الأهداف',
            index: 3,
            context: context,
          ),
          _buildNavItem(
            icon: Icons.analytics_outlined,
            label: 'التحليلات',
            index: 2,
            context: context,
          ),
          _buildNavItem(
            icon: Icons.account_balance_wallet_outlined,
            label: 'المحفظة',
            index: 1,
            context: context,
          ),
          _buildNavItem(
            icon: Icons.home,
            label: 'الرئيسية',
            index: 0,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final isSelected = index == currentIndex;
    final color = isSelected ? AppTheme.primary : AppTheme.onSurfaceVariant;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 26.0,
          ),
          const SizedBox(height: 2.0),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10.0,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          if (isSelected) ...[
            const SizedBox(height: 2.0),
            Container(
              width: 4.0,
              height: 4.0,
              decoration: const BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
