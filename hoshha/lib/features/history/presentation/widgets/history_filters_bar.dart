import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/app_providers.dart';
import '../../../../theme/theme_extensions.dart';
import '../../../expenses/application/models/date_range.dart';
import '../../../expenses/presentation/controllers/add_expense_controller.dart';
import '../providers/history_filters_provider.dart';
import 'history_category_filter.dart';
import 'history_date_range_selector.dart';
import 'history_sort_selector.dart';

class HistoryFiltersBar extends ConsumerWidget {
  const HistoryFiltersBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.appSpacing;
    final state = ref.watch(historyFiltersProvider);
    final controller = ref.read(historyFiltersProvider.notifier);
    final categories = ref.watch(expenseCategoryOptionsProvider);
    final now = ref.watch(clockProvider).now();

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: spacing.md,
              runSpacing: spacing.md,
              children: [
                HistoryDateRangeSelector(
                  selectedRange: state.dateRange,
                  now: now,
                  onSelectCustomRange: () => _selectDateRange(
                    context,
                    controller,
                    now,
                    state.dateRange ?? DateRange.month(now),
                  ),
                  onSelectCurrentMonth: controller.resetToCurrentMonth,
                  onClearDateRange: () => controller.selectDateRange(null),
                ),
                HistorySortSelector(
                  selectedSort: state.sort,
                  onSelected: controller.selectSort,
                ),
              ],
            ),
            SizedBox(height: spacing.md),
            HistoryCategoryFilter(
              options: categories,
              selectedCategoryId: state.normalizedCategoryId,
              onSelected: controller.selectCategory,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateRange(
    BuildContext context,
    HistoryFiltersController controller,
    DateTime now,
    DateRange currentRange,
  ) async {
    final initialDateRange = DateTimeRange(
      start: currentRange.start,
      end: currentRange.end.subtract(const Duration(days: 1)),
    );

    final pickedRange = await showDateRangePicker(
      context: context,
      initialDateRange: initialDateRange,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5, 12, 31),
      helpText: 'اختر الفترة',
      cancelText: 'إلغاء',
      confirmText: 'تأكيد',
      saveText: 'حفظ',
      fieldStartHintText: 'من',
      fieldEndHintText: 'إلى',
      errorInvalidRangeText: 'الفترة غير صالحة',
      errorFormatText: 'صيغة التاريخ غير صحيحة',
      errorInvalidText: 'تاريخ غير صالح',
      locale: const Locale('ar'),
    );

    if (pickedRange == null) {
      return;
    }

    controller.selectDateRange(
      DateRange(
        start: DateTime(
          pickedRange.start.year,
          pickedRange.start.month,
          pickedRange.start.day,
        ),
        end: DateTime(
          pickedRange.end.year,
          pickedRange.end.month,
          pickedRange.end.day + 1,
        ),
      ),
    );
  }
}
