import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/register_form_widget.dart';
import '../widgets/social_login_buttons.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin, vertical: 24.0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Illustration
                  Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAzuE0RHzEtVAhN_-VldH46hLYqKUSCgcPb7ZBA5Ho4rnEKUy-R7bLD59ozNO2muZWFsUfieU5rOeMgOEInOrVJ1tTQ_4hNxxzTGKrm-1urTPZLnetnAMxyUZXUwnqIdjY6V1NDktj_C-_5CgufodA7RKxnSEMKoGB9fiEUrFbg55aYl33kWE8hatQXi_rhspgDDZI_cvahPx8lusV0gf5zIFM1TgPSWpTztbM2fy7RIwgSRuG38NhYt8amhp1grZQM9svYYcZSgV_R',
                    width: 192.0,
                    height: 192.0,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.wallet_giftcard_outlined,
                        size: 96.0,
                        color: AppTheme.primary,
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Brand Logo Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
                          ),
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'حوشة',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Titles
                  Text(
                    'إنشاء حساب جديد',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: AppTheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'ابدأ رحلتك نحو إدارة أموالك بذكاء.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // Register Form
                  const RegisterFormWidget(),
                  const SizedBox(height: 24.0),

                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider(color: AppTheme.surfaceContainerHighest)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'أو',
                          style: theme.textTheme.labelSmall?.copyWith(color: AppTheme.outline),
                        ),
                      ),
                      const Expanded(child: Divider(color: AppTheme.surfaceContainerHighest)),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // Social Buttons
                  const SocialLoginButtons(),
                  const SizedBox(height: 32.0),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لديك حساب بالفعل؟',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppTheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'تسجيل الدخول',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
