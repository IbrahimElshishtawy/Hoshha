import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _pushNotifications = true;
  String _selectedCurrency = 'SAR';
  String _selectedLanguage = 'ar';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الإعدادات واللغة',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withValues(alpha: 0.7),
        elevation: 2.0,
        shadowColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.onSurfaceVariant),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.containerMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Settings Cards
            _buildSettingsHeader('عام'),
            _buildSettingsContainer([
              _buildSwitchRow(
                title: 'الوضع الداكن (Dark Mode)',
                value: _darkMode,
                onChanged: (val) {
                  setState(() {
                    _darkMode = val;
                  });
                },
              ),
              const Divider(height: 1.0),
              _buildDropdownRow(
                title: 'العملة المفضلة',
                value: _selectedCurrency,
                items: const [
                  DropdownMenuItem(value: 'SAR', child: Text('ريال سعودي (SAR)')),
                  DropdownMenuItem(value: 'USD', child: Text('دولار أمريكي (USD)')),
                  DropdownMenuItem(value: 'EGP', child: Text('جنيه مصري (EGP)')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _selectedCurrency = val;
                    });
                  }
                },
              ),
              const Divider(height: 1.0),
              _buildDropdownRow(
                title: 'اللغة الحالية',
                value: _selectedLanguage,
                items: const [
                  DropdownMenuItem(value: 'ar', child: Text('العربية (Arabic)')),
                  DropdownMenuItem(value: 'en', child: Text('الإنجليزية (English)')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _selectedLanguage = val;
                    });
                  }
                },
              ),
            ]),
            const SizedBox(height: 24.0),

            _buildSettingsHeader('الإشعارات والتنبيهات'),
            _buildSettingsContainer([
              _buildSwitchRow(
                title: 'إشعارات الدفع والإنفاق',
                value: _pushNotifications,
                onChanged: (val) {
                  setState(() {
                    _pushNotifications = val;
                  });
                },
              ),
              const Divider(height: 1.0),
              _buildActionRow(
                title: 'مواعيد التذكير اليومية',
                trailing: const Text('8:00 م', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 24.0),

            _buildSettingsHeader('الحماية والأمان'),
            _buildSettingsContainer([
              _buildActionRow(
                title: 'قفل التطبيق بالبصمة (FaceID)',
                trailing: const Icon(Icons.chevron_left, color: AppTheme.outline),
                onTap: () {},
              ),
              const Divider(height: 1.0),
              _buildActionRow(
                title: 'تغيير رمز المرور الشخصي',
                trailing: const Icon(Icons.chevron_left, color: AppTheme.outline),
                onTap: () {},
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: AppTheme.onSurfaceVariant,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _buildSettingsContainer(List<Widget> children) {
    return Container(
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
        children: children,
      ),
    );
  }

  Widget _buildSwitchRow({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
        textAlign: TextAlign.end,
      ),
      leading: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppTheme.primary,
      ),
    );
  }

  Widget _buildDropdownRow<T>({
    required String title,
    required T value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
        textAlign: TextAlign.end,
      ),
      leading: DropdownButton<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        underline: const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildActionRow({
    required String title,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
        textAlign: TextAlign.end,
      ),
      leading: trailing,
    );
  }
}
