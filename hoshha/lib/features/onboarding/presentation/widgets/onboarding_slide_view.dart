import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../pages/onboarding_page.dart';

class OnboardingSlideView extends StatelessWidget {
  final OnboardingSlideData slide;

  const OnboardingSlideView({
    super.key,
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Graphic Illustration Container (Floating effect)
          Container(
            height: 240,
            width: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: slide.color.withValues(alpha: 0.1),
              boxShadow: [
                BoxShadow(
                  color: slide.color.withValues(alpha: 0.15),
                  blurRadius: 30.0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              slide.icon,
              size: 100.0,
              color: slide.color,
            ),
          ),
          const SizedBox(height: 48.0),

          // Titles and description (Arabic RTL)
          Text(
            slide.title,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            slide.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppTheme.onSurfaceVariant,
              fontSize: 14.0,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
