import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class OnboardingControls extends StatelessWidget {
  final int pageCount;
  final int currentPage;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingControls({
    super.key,
    required this.pageCount,
    required this.currentPage,
    required this.onSkip,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin, vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Next/Get Started Button
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4.0,
            ),
            child: Text(
              currentPage == pageCount - 1 ? 'ابدأ الآن' : 'التالي',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // Indicators
          Row(
            children: List.generate(pageCount, (index) {
              final isCurrent = index == currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: isCurrent ? 24.0 : 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: isCurrent ? AppTheme.primary : AppTheme.outlineVariant,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              );
            }),
          ),

          // Skip Button
          TextButton(
            onPressed: onSkip,
            child: Text(
              currentPage == pageCount - 1 ? '' : 'تخطي',
              style: const TextStyle(
                color: AppTheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
