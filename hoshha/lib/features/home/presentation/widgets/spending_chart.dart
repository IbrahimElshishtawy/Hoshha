import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SpendingChart extends StatefulWidget {
  const SpendingChart({super.key});

  @override
  State<SpendingChart> createState() => _SpendingChartState();
}

class _SpendingChartState extends State<SpendingChart> {
  bool _isWeekly = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Dynamic heights based on weekly/monthly tab selection
    final heights = _isWeekly
        ? [0.40, 0.65, 0.35, 0.90, 0.55, 0.45, 0.70]
        : [0.75, 0.30, 0.85, 0.45, 0.95, 0.60, 0.50];

    final days = ['ح', 'ن', 'ث', 'ر', 'خ', 'ج', 'س'];

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Tab toggle selector
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    _buildTabButton(
                      title: 'شهري',
                      isSelected: !_isWeekly,
                      onTap: () => setState(() => _isWeekly = false),
                    ),
                    _buildTabButton(
                      title: 'أسبوعي',
                      isSelected: _isWeekly,
                      onTap: () => setState(() => _isWeekly = true),
                    ),
                  ],
                ),
              ),
              // Title
              Text(
                'نزعات الإنفاق',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppTheme.onSurface,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),

          // Custom Bar Chart
          SizedBox(
            height: 150.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(7, (index) {
                // Alternating colors representing depth
                final Color barColor = index % 3 == 0
                    ? AppTheme.primaryFixed
                    : (index % 3 == 1
                        ? AppTheme.primaryContainer
                        : AppTheme.primary);

                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // The animated chart bar
                      Expanded(
                        child: FractionallySizedBox(
                          heightFactor: heights[index],
                          alignment: Alignment.bottomCenter,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              color: barColor,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      // Day label
                      Text(
                        days[index],
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppTheme.outline,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppTheme.primary : AppTheme.onSurfaceVariant,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
