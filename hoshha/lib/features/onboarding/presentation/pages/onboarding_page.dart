import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingSlideData> _slides = const [
    OnboardingSlideData(
      title: 'تتبع مصاريفك بسهولة',
      description: 'سجل معاملاتك اليومية بلمحة بصر وراقب أين تذهب أموالك من خلال تصنيفات ذكية ومؤشرات واضحة.',
      icon: Icons.track_changes,
      glowColor: AppTheme.primary,
    ),
    OnboardingSlideData(
      title: 'حدد أهدافك المالية',
      description: 'سواء كنت تدخر لشراء سيارة جديدة، أو منزل، أو تخطط لرحلة؛ يساعدك هوشة على تقسيم أهدافك ومتابعة تقدمك.',
      icon: Icons.savings,
      glowColor: AppTheme.secondary,
    ),
    OnboardingSlideData(
      title: 'تحليل ذكي ومخصص',
      description: 'احصل على نصائح ذكية من مساعد هوشة القائم على الذكاء الاصطناعي لتحسين سلوكك المالي وزيادة مدخراتك.',
      icon: Icons.psychology,
      glowColor: AppTheme.tertiary,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background glows
          Positioned(
            top: -100,
            right: -100,
            width: 350,
            height: 350,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _slides[_currentPage].glowColor.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            width: 300,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _slides[_currentPage].glowColor.withValues(alpha: 0.04),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top bar with Skip button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.containerMargin,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage < _slides.length - 1)
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/');
                          },
                          child: const Text(
                            'تخطي',
                            style: TextStyle(
                              color: AppTheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      const Text(
                        'هوشة',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),

                // Slides view
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: _slides.length,
                    itemBuilder: (context, index) {
                      final slide = _slides[index];
                      return Padding(
                        padding: const EdgeInsets.all(AppTheme.containerMargin),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 3D-like glowing circular icon container
                            Container(
                              width: 220.0,
                              height: 220.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: slide.glowColor.withValues(alpha: 0.15),
                                    blurRadius: 30.0,
                                    spreadRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Container(
                                  width: 170.0,
                                  height: 170.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: slide.glowColor.withValues(alpha: 0.1),
                                  ),
                                  child: Icon(
                                    slide.icon,
                                    size: 80.0,
                                    color: slide.glowColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 48.0),
                            // Slide Title
                            Text(
                              slide.title,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: AppTheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16.0),
                            // Slide Description
                            Text(
                              slide.description,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: AppTheme.onSurfaceVariant,
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Bottom navigation controls
                Padding(
                  padding: const EdgeInsets.all(AppTheme.containerMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Next Button
                      ElevatedButton(
                        onPressed: _onNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          minimumSize: const Size(120, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          _currentPage == _slides.length - 1 ? 'ابدأ الآن' : 'التالي',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Indicators
                      Row(
                        children: List.generate(
                          _slides.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: _currentPage == index ? 24.0 : 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: _currentPage == index ? AppTheme.primary : AppTheme.outlineVariant,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
  final Color glowColor;

  const OnboardingSlideData({
    required this.title,
    required this.description,
    required this.icon,
    required this.glowColor,
  });
}
