import 'package:flutter/material.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'package:hoshha/theme/theme_extensions.dart';

class SmartTipCard extends StatelessWidget {
  const SmartTipCard({
    required this.smartTip,
    super.key,
  });

  final String smartTip;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    final isRtl = Directionality.of(context) == TextDirection.rtl;

    const goldColor = Color(0xFF8B6F15);
    final lightGoldBg = goldColor.withValues(alpha: 0.08);

    return Container(
      width: double.infinity,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius.lg),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: isRtl
                  ? const BorderSide(color: goldColor, width: 5)
                  : BorderSide.none,
              left: !isRtl
                  ? const BorderSide(color: goldColor, width: 5)
                  : BorderSide.none,
            ),
          ),
          padding: EdgeInsets.all(spacing.lg),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.homeSmartTipTitle,
                      style: const TextStyle(
                        color: goldColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      smartTip,
                      style: TextStyle(
                        color: colors.onSurface.withValues(alpha: 0.75),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: lightGoldBg,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lightbulb_outline,
                  color: goldColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
