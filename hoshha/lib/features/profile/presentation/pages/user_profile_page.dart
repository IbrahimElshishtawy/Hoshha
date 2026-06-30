import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

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
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.primary.withValues(alpha: 0.1),
                      border: Border.all(color: AppTheme.primary, width: 2.0),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60.0,
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'عبدالله الششتواي',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'abdullah@hoshha.com',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),

            // Profile List Menu Options
            _buildMenuItem(
              icon: Icons.account_balance_wallet,
              title: 'إدارة المحافظ',
              onTap: () {
                // Open wallet management page or similar
              },
            ),
            _buildMenuItem(
              icon: Icons.pie_chart,
              title: 'الميزانيات والحدود',
              onTap: () => Navigator.pushNamed(context, '/budget'),
            ),
            _buildMenuItem(
              icon: Icons.receipt_long,
              title: 'منبه الفواتير',
              onTap: () => Navigator.pushNamed(context, '/bills'),
            ),
            _buildMenuItem(
              icon: Icons.handshake,
              title: 'مجدول الديون',
              onTap: () => Navigator.pushNamed(context, '/debt'),
            ),
            _buildMenuItem(
              icon: Icons.settings,
              title: 'الإعدادات واللغة',
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'الدعم والمساعدة',
              onTap: () {},
            ),
            const Divider(height: 32.0),

            // Sign out Option
            _buildMenuItem(
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

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = AppTheme.onSurface,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
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
      child: ListTile(
        onTap: onTap,
        leading: Icon(Icons.chevron_left, color: color.withValues(alpha: 0.5)),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.end,
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
