import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/auth_cubit.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  static const String googleSvg = '''
<svg viewBox="0 0 24 24">
  <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"></path>
  <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"></path>
  <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l3.66-2.84z" fill="#FBBC05"></path>
  <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"></path>
</svg>
''';

  static const String appleSvg = '''
<svg viewBox="0 0 24 24">
  <path d="M17.05 20.28c-.98.95-2.05 1.78-3.22 1.76-1.12-.02-1.48-.68-2.78-.68-1.3 0-1.71.66-2.78.7-.11 0-2.19-.07-3.32-1.71-2.29-3.32-2.18-8.49.56-11.41 1.37-1.45 3.12-2.23 4.54-2.23 1.09 0 2.14.46 2.76.46s1.65-.46 2.74-.46c.92.01 2.25.33 3.25 1.4-.07.06-1.95 1.14-1.93 3.44.02 2.79 2.45 3.75 2.48 3.76-.02.04-.39 1.34-1.3 2.97zM12.03 5.4c-.02-2.28 1.88-4.2 4.07-4.4.15 2.53-2.03 4.41-4.07 4.4z" fill="currentColor"></path>
</svg>
''';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Google button
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.read<AuthCubit>().loginWithGoogle();
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              side: const BorderSide(color: AppTheme.surfaceVariant),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
              ),
              backgroundColor: Colors.white.withValues(alpha: 0.7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Google',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppTheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8.0),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: SvgPicture.string(googleSvg),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: AppTheme.inlineGap),
        // Apple button
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // Apple login is not implemented in Cubit yet, but we will mock it
            },
             style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              side: const BorderSide(color: AppTheme.surfaceVariant),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
              ),
              backgroundColor: Colors.white.withValues(alpha: 0.7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Apple',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppTheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8.0),
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: SvgPicture.string(
                    appleSvg,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
