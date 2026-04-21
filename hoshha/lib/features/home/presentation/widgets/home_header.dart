import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';

import '../../../../theme/theme_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final currentMonth = DateFormat.yMMMM(locale).format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: spacing.md,
            vertical: spacing.sm,
          ),
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: BorderRadiusDirectional.circular(
              context.appRadius.md,
            ),
          ),
          child: Text(
            '${l10n.homeThisMonth} • $currentMonth',
            style: theme.textTheme.labelLarge?.copyWith(color: colors.primary),
          ),
        ),
        SizedBox(height: spacing.md),
        Text(
          l10n.homeGreetingTitle,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: spacing.sm),
        Text(
          l10n.homeGreetingSubtitle,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
