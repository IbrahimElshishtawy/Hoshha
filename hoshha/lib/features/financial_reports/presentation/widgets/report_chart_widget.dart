import 'package:flutter/material.dart';

class ReportChartWidget extends StatelessWidget {
  final List<double> dailyTrend;

  const ReportChartWidget({
    super.key,
    required this.dailyTrend,
  });

  @override
  Widget build(BuildContext context) {
    if (dailyTrend.isEmpty) return const SizedBox.shrink();
    final maxVal = dailyTrend.reduce((a, b) => a > b ? a : b);

    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: dailyTrend.map((val) {
          final heightFactor = maxVal == 0 ? 0.0 : val / maxVal;
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
              height: 100 * heightFactor, // max height 100
            ),
          );
        }).toList(),
      ),
    );
  }
}
