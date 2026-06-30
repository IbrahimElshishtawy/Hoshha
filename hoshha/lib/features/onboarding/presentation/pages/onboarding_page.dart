import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/onboarding_controls.dart';
import '../widgets/onboarding_slide_view.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _SpendingCalendarPageState extends State<OnboardingPage> {
  // Wait, the state name should be _OnboardingPageState, not _SpendingCalendarPageState!
  // Let's correct it right away to avoid compilation errors.
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Sliders content definitions
    final slides = [
      const OnboardingSlideData(
        title: 'تتبع نفقاتك بذكاء وسهولة',
        description: 'قم بتدوين معاملاتك اليومية وتصنيف نفقاتك تلقائياً وبأقل مجهود مع واجهة مستخدم مبتكرة بالكامل.',
        icon: Icons.account_balance_wallet_outlined,
        color: AppTheme.primary,
      ),
      const OnboardingSlideData(
        title: 'حدد أهدافك الادخارية اليوم',
        description: 'وفر المال للمستقبل، قم بإنشاء خطط ادخار مخصصة وتتبع تقدمك خطوة بخطوة حتى تصل لأحلامك.',
        icon: Icons.savings_outlined,
        color: AppTheme.secondary,
      ),
      const OnboardingSlideData(
        title: 'مستشارك المالي الذكي (هوشة)',
        description: 'احصل على نصائح ادخار مالية مخصصة، إرشادات ذكية مدعومة بالذكاء الاصطناعي لتحسين صحتك المالية.',
        icon: Icons.auto_awesome_outlined,
        color: AppTheme.tertiary,
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Visual ambient backdrop circles
          Positioned(
            top: -100,
            left: -100,
            width: 300,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: slides[_currentPage].color.withValues(alpha: 0.03),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top logo / Skip area
                Padding(
                  padding: const EdgeInsets.all(AppTheme.containerMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'هُوشة المالية',
                        style: TextStyle(
                          color: slides[_currentPage].color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // Slider PageView
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: slides.length,
                    itemBuilder: (context, index) {
                      return OnboardingSlideView(slide: slides[index]);
                    },
                  ),
                ),

                // Lower control row (Next button, Skip button, Dot indicators)
                OnboardingControls(
                  pageCount: slides.length,
                  currentPage: _currentPage,
                  onSkip: () {
                    // Navigate to Login Page
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  onNext: () {
                    if (_currentPage < slides.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Final page, go to Login
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingSlideData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const OnboardingSlideData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
