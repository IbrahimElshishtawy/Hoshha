import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';
import '../widgets/expense_history_list.dart';
import '../widgets/history_filters_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('السجل')),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Padding(
                padding: EdgeInsetsDirectional.all(spacing.lg),
                child: Column(
                  children: [
                    const HistoryFiltersBar(),
                    SizedBox(height: spacing.lg),
                    const Expanded(child: ExpenseHistoryList()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
