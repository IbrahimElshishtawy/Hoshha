import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? trailingText;
  final bool hasArrow;
  final bool isSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailingText,
    this.hasArrow = true,
    this.isSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSwitch ? () => onSwitchChanged?.call(!switchValue) : onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isSwitch)
              Switch(
                value: switchValue,
                onChanged: onSwitchChanged,
                activeColor: Theme.of(context).colorScheme.primary,
              )
            else if (trailingText != null || hasArrow)
              Row(
                children: [
                  if (trailingText != null)
                    Text(
                      trailingText!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  if (hasArrow) ...[
                    const SizedBox(width: 8),
                    Icon(
                      Icons.chevron_left, // Right-to-left layout uses left arrow for forward navigation
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }
}
