import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_state.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('الإعدادات', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: const Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SettingsLoaded) {
            final setting = state.setting;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SettingsSection(
                    title: 'العرض واللغة',
                    children: [
                      SettingsItem(
                        icon: Icons.dark_mode_outlined,
                        title: 'الوضع الليلي',
                        isSwitch: true,
                        switchValue: setting.isDarkMode,
                        onSwitchChanged: (value) =>
                            context.read<SettingsCubit>().toggleDarkMode(value),
                      ),
                      SettingsItem(
                        icon: Icons.language_outlined,
                        title: 'اللغة',
                        trailingText: 'العربية',
                        onTap: () {},
                      ),
                      SettingsItem(
                        icon: Icons.payments_outlined,
                        title: 'العملة الأساسية',
                        trailingText: '${setting.currency} - ريال سعودي',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'الأمان',
                    children: [
                      SettingsItem(
                        icon: Icons.fingerprint_outlined,
                        title: 'قفل البصمة',
                        isSwitch: true,
                        switchValue: setting.isBiometricEnabled,
                        onSwitchChanged: (value) =>
                            context.read<SettingsCubit>().toggleBiometric(value),
                      ),
                      SettingsItem(
                        icon: Icons.password_outlined,
                        title: 'رمز التعريف الشخصي (PIN)',
                        trailingText: 'تغيير الرمز',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'إدارة البيانات',
                    children: [
                      SettingsItem(
                        icon: Icons.cloud_upload_outlined,
                        title: 'نسخة احتياطية',
                        subtitle: 'آخر نسخة: اليوم، 12:30 م',
                        onTap: () {},
                      ),
                      SettingsItem(
                        icon: Icons.cloud_download_outlined,
                        title: 'استعادة البيانات',
                        onTap: () {},
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: 'عام',
                    children: [
                      SettingsItem(
                        icon: Icons.notifications_active_outlined,
                        title: 'التنبيهات',
                        onTap: () {},
                      ),
                      SettingsItem(
                        icon: Icons.gavel_outlined,
                        title: 'الخصوصية والسياسة',
                        onTap: () {},
                      ),
                      SettingsItem(
                        icon: Icons.info_outline,
                        title: 'عن التطبيق',
                        trailingText: 'الإصدار 2.4.0',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.logout, color: Colors.red),
                    label: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 40), // Spacing for bottom nav if any
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
