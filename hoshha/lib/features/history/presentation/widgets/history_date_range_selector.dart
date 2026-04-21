import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../theme/theme_extensions.dart';
import '../../../expenses/application/models/date_range.dart';

class HistoryDateRangeSelector extends StatelessWidget {
  const HistoryDateRangeSelector({
    super.key,
    required this.selectedRange,
    required this.now,
    required this.onSelectCustomRange,
    required this.onSelectCurrentMonth,
    required this.onClearDateRange,
  });

  final DateRange? selectedRange;
  final DateTime now;
  final VoidCallback onSelectCustomRange;
  final VoidCallback onSelectCurrentMonth;
  final VoidCallback onClearDateRange;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final isCurrentMonth = selectedRange == DateRange.month(now);
    final isAllDates = selectedRange == null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الفترة', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: spacing.sm),
        Wrap(
          spacing: spacing.sm,
          runSpacing: spacing.sm,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: onSelectCustomRange,
              icon: const Icon(Icons.date_range_rounded),
              label: Text(_formatRangeLabel(context, selectedRange)),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: spacing.md,
                  vertical: spacing.md,
                ),
                alignment: AlignmentDirectional.centerStart,
              ),
            ),
            ChoiceChip(
              label: const Text('هذا الشهر'),
              selected: isCurrentMonth,
              onSelected: isCurrentMonth ? null : (_) => onSelectCurrentMonth(),
            ),
            ChoiceChip(
              label: const Text('كل الفترات'),
              selected: isAllDates,
              onSelected: isAllDates ? null : (_) => onClearDateRange(),
            ),
          ],
        ),
      ],
    );
  }

  String _formatRangeLabel(BuildContext context, DateRange? range) {
    if (range == null) {
      return 'كل الفترات';
    }

    final locale = Localizations.localeOf(context).toLanguageTag();
    final formatter = DateFormat.yMMMd(locale);
    final displayEnd = range.end.subtract(const Duration(days: 1));

    return '${formatter.format(range.start)} - ${formatter.format(displayEnd)}';
  }
}
