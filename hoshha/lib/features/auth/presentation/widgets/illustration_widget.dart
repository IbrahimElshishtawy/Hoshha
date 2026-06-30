import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class IllustrationWidget extends StatelessWidget {
  const IllustrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 256.0,
        height: 256.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Decorative Glow Background
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primary.withOpacity(0.12),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.2),
                    blurRadius: 60.0,
                    spreadRadius: 30.0,
                  ),
                ],
              ),
            ),
            // Illustration Image
            Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAlhHVI61-X1zVQPAYvj2ouhl91CCDaVBu-LUk9mRSpbrDhgWLI8lxYAHSXYc6SLv3FKMge8fc-X8qT9B379gDwjYtO9WN-A0lg81rtWmfjMT8kqOOFi2SXAyahABlFu36d3OrYIkqMvn4N8J__EpYR1LnRR9i4Q8E2yhZ-KbO-DGcB6pFDZnHHKHmw-E4lDlZ-__YUtjZfcI8tJRFKTHVzBJ22ZLsYZe8_l61n_ZJGa7huRzRZ4PiBYvy2QQuMe063FMm14FPtBU4e',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // Fallback icon if network image fails
                return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceContainer,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 64.0,
                    color: AppTheme.primary,
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
