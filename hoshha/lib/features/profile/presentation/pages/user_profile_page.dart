import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_menu_item.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withValues(alpha: 0.7),
        elevation: 2.0,
        shadowColor: Colors.black12,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.containerMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // User Header Info
            const ProfileHeaderCard(
              name: 'عبدالله الششتواي',
              email: 'abdullah@hoshha.com',
            ),
            const SizedBox(height: 32.0),

            // Profile List Menu Options
            ProfileMenuItem(
              icon: Icons.account_balance_wallet,
              title: 'إدارة المحافظ',
              onTap: () {
                // Open wallet management page or similar
              },
            ),
            ProfileMenuItem(
              icon: Icons.pie_chart,
              title: 'الميزانيات والحدود',
              onTap: () => Navigator.pushNamed(context, '/budget'),
            ),
            ProfileMenuItem(
              icon: Icons.receipt_long,
              title: 'منبه الفواتير',
              onTap: () => Navigator.pushNamed(context, '/bills'),
            ),
            ProfileMenuItem(
              icon: Icons.handshake,
              title: 'مجدول الديون',
              onTap: () => Navigator.pushNamed(context, '/debt'),
            ),
            ProfileMenuItem(
              icon: Icons.settings,
              title: 'الإعدادات واللغة',
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            ProfileMenuItem(
              icon: Icons.help_outline,
              title: 'الدعم والمساعدة',
              onTap: () {},
            ),
            const Divider(height: 32.0),

            // Sign out Option
            ProfileMenuItem(
              icon: Icons.logout,
              title: 'تسجيل الخروج',
              color: AppTheme.error,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
