import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/illustration_widget.dart';
import '../widgets/login_form_widget.dart';
import '../widgets/social_login_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: Scaffold(
        appBar: const AuthHeader(),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('مرحباً بك ${state.user.name ?? state.user.email}'),
                  backgroundColor: AppTheme.secondary,
                ),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('حدث خطأ: ${state.errorMessage}'),
                  backgroundColor: AppTheme.error,
                ),
              );
            }
          },
          child: Stack(
            children: [
              // Decorative Bottom Gradient
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.25,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppTheme.primary.withOpacity(0.05),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Main content
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.containerMargin,
                  ),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 450),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 16.0),

                          // Illustration Section
                          const IllustrationWidget(),
                          const SizedBox(height: AppTheme.stackGap),

                          // Welcoming Text
                          Text(
                            'تسجيل الدخول',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'مرحباً بك مجدداً في حوشة',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: AppTheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 32.0),

                          // Login Form
                          const LoginFormWidget(),
                          const SizedBox(height: 24.0),

                          // Divider
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: AppTheme.surfaceContainerHighest,
                                  thickness: 1.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  'أو المتابعة باستخدام',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: AppTheme.outline,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  color: AppTheme.surfaceContainerHighest,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),

                          // Social Buttons
                          const SocialLoginButtons(),
                          const SizedBox(height: 32.0),

                          // Footer link
                          const AuthFooter(),
                          const SizedBox(height: 48.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
