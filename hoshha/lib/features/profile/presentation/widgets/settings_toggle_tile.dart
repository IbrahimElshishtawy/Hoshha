import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SettingsToggleTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsToggleTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
        textAlign: TextAlign.end,
      ),
      leading: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppTheme.primary,
      ),
    );
  }
}
