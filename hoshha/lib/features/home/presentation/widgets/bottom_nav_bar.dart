import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'package:hoshha/theme/theme_extensions.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.currentRoute,
    required this.onAddPressed,
    super.key,
  });

  final String currentRoute;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.appColors;
    final spacing = context.appSpacing;

    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing.sm, horizontal: spacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: colors.outline.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Tab (Active)
            _buildTabItem(
              context: context,
              isActive: currentRoute == '/',
              icon: Icons.home_filled,
              label: l10n.homeBottomNavHome,
              onTap: () {
                if (currentRoute != '/') {
                  context.go('/');
                }
              },
            ),
            // Journey Tab
            _buildTabItem(
              context: context,
              isActive: currentRoute == '/history',
              icon: Icons.analytics_outlined,
              label: l10n.homeBottomNavJourney,
              onTap: () {
                if (currentRoute != '/history') {
                  context.go('/history');
                }
              },
            ),
            // Add Button
            GestureDetector(
              onTap: onAddPressed,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: colors.primary,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colors.primary.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  color: colors.primary,
                  size: 28,
                ),
              ),
            ),
            // Goals Tab
            _buildTabItem(
              context: context,
              isActive: currentRoute == '/budget',
              icon: Icons.account_balance_wallet_outlined,
              label: l10n.homeBottomNavGoals,
              onTap: () {
                if (currentRoute != '/budget') {
                  context.go('/budget');
                }
              },
            ),
            // Identity Tab (Settings/More)
            _buildTabItem(
              context: context,
              isActive: currentRoute == '/settings',
              icon: Icons.widgets_outlined,
              label: l10n.homeBottomNavIdentity,
              onTap: () {
                if (currentRoute != '/settings') {
                  context.go('/settings');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required BuildContext context,
    required bool isActive,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    if (isActive) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.md,
            vertical: spacing.sm,
          ),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(radius.pill),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.grey.shade500,
                size: 22,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
