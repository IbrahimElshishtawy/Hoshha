import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../theme/theme_extensions.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onPressed,
    this.enabled = true,
  });

  final DateTime selectedDate;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final theme = Theme.of(context);
    final formattedDate = DateFormat.yMMMMd(
      locale,
    ).add_jm().format(selectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('التاريخ', style: theme.textTheme.titleSmall),
        SizedBox(height: spacing.md),
        OutlinedButton.icon(
          onPressed: enabled ? onPressed : null,
          icon: const Icon(Icons.calendar_month_rounded),
          label: Text(formattedDate),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: spacing.md,
              vertical: spacing.md,
            ),
            alignment: AlignmentDirectional.centerStart,
          ),
        ),
      ],
    );
  }
}
