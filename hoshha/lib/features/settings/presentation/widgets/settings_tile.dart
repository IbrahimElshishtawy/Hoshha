import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
    this.onTap,
    this.selected = false,
    this.destructive = false,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? trailing;
  final Future<void> Function()? onTap;
  final bool selected;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final titleColor = destructive ? colors.error : theme.colorScheme.onSurface;
    final subtitleColor = destructive
        ? colors.error.withValues(alpha: 0.8)
        : theme.colorScheme.onSurface.withValues(alpha: 0.68);
    final tileColor = selected
        ? colors.primary.withValues(alpha: 0.08)
        : Colors.transparent;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap == null
            ? null
            : () async {
                await onTap!.call();
              },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: spacing.md,
            vertical: spacing.md,
          ),
          decoration: BoxDecoration(color: tileColor),
          child: Row(
            children: [
              if (icon != null) ...[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: destructive
                        ? colors.error.withValues(alpha: 0.1)
                        : colors.surfaceContainer,
                    borderRadius: BorderRadiusDirectional.circular(
                      context.appRadius.md,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    size: 20,
                    color: destructive ? colors.error : colors.primary,
                  ),
                ),
                SizedBox(width: spacing.md),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: titleColor,
                      ),
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: spacing.xs),
                      Text(
                        subtitle!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: subtitleColor,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: spacing.sm),
              if (trailing != null)
                trailing!
              else if (selected)
                Icon(
                  Icons.check_circle_rounded,
                  color: destructive ? colors.error : colors.primary,
                )
              else if (onTap != null)
                Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
