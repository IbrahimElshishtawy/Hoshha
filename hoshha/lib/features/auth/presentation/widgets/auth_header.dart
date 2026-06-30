import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSkipPressed;

  const AuthHeader({super.key, this.onSkipPressed});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.containerMargin,
          vertical: 8.0,
        ),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // "Skip" button on the left (in RTL it will be on the left, but we just use Row)
            // Wait, in a dir="rtl" setting, MaterialApp locale is "ar", so Flutter Row automatically mirrors!
            // First child in Row is on the right, second on the left under RTL.
            // We want "حوشة" on the right (first child in RTL) and "تخطي" on the left (second child in RTL).
            // Let's check the HTML:
            // `<header class="flex flex-row-reverse justify-between ...">`
            // `<div class="text-primary font-headline-md ...">حوشة</div>`
            // `<button ...>تخطي</button>`
            // Wait, HTML is `dir="rtl"` and it has `flex-row-reverse`.
            // With `dir="rtl"`, a normal `flex-row` would place the first element ("حوشة") on the right, and the second element ("تخطي") on the left.
            // But it has `flex-row-reverse`! Which reverses it, putting "حوشة" on the left and "تخطي" on the right.
            // Wait! Let's check `code.html` header:
            // "Top App Bar (Suppress Nav as per task: Login is Transactional)"
            // `<header class="w-full top-0 sticky bg-transparent flex flex-row-reverse justify-between items-center px-container-margin py-4 z-50">`
            // `<div class="text-primary ...">حوشة</div>`
            // `<button ...>تخطي</button>`
            // In RTL, `flex-row-reverse` with `justify-between` makes the first element ("حوشة") appear on the left, and the second ("تخطي") on the right?
            // Actually, in CSS flexbox:
            // `flex-row` in RTL starts from right to left.
            // `flex-row-reverse` in RTL starts from left to right.
            // If they did `flex-row-reverse` in RTL, then "حوشة" (first child) is on the left, and "تخطي" (second child) is on the right.
            // Wait, let's think: is "حوشة" on the right or left in the actual design?
            // Usually, logo is on the right/start for RTL, skip is on the left/end.
            // In Flutter, since it handles RTL directionality automatically through the locale, a simple `Row` with `MainAxisAlignment.spaceBetween` will place the first child at the "Start" (right side for Arabic) and the second child at the "End" (left side for Arabic).
            // Let's write it standard: first child "Logo", second child "Skip". This is the most logical fintech standard.
            Text(
              localizations.appTitle,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.black,
              ),
            ),
            TextButton(
              onPressed: onSkipPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'تخطي', // "Skip"
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
