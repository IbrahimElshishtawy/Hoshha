import 'package:flutter/material.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'package:hoshha/theme/theme_extensions.dart';

class BudgetStatusCard extends StatelessWidget {
  const BudgetStatusCard({
    required this.budgetPercentage,
    super.key,
  });

  final double budgetPercentage;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    // Use a custom gold/bronze color matching the screenshot
    const goldColor = Color(0xFF8B6F15);
    final lightGoldBg = goldColor.withValues(alpha: 0.08);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colors.outline.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.homeBudgetStatusTitle,
            style: TextStyle(
              color: colors.onSurface.withValues(alpha: 0.8),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 140,
              height: 140,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colors.outline.withValues(alpha: 0.15),
                    ),
                  ),
                  CircularProgressIndicator(
                    value: budgetPercentage / 100,
                    strokeWidth: 10,
                    strokeCap: StrokeCap.round,
                    valueColor: const AlwaysStoppedAnimation<Color>(goldColor),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${budgetPercentage.toInt()}%',
                        style: const TextStyle(
                          color: colors.onSurface,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.homeBudgetExcellent,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: lightGoldBg,
                borderRadius: BorderRadius.circular(radius.pill),
                border: Border.all(
                  color: goldColor.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: goldColor,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    l10n.homeBudgetStablePerformance,
                    style: const TextStyle(
                      color: goldColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
