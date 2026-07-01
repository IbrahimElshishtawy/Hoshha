import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class IllustrationWidget extends StatefulWidget {
  final String imageUrl;
  final double size;

  const IllustrationWidget({
    super.key,
    required this.imageUrl,
    this.size = 256.0,
  });

  @override
  State<IllustrationWidget> createState() => _IllustrationWidgetState();
}

class _IllustrationWidgetState extends State<IllustrationWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Decorative Glow Background
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: widget.size * 0.75 + (_animation.value / 2),
                  height: widget.size * 0.75 + (_animation.value / 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.primary.withValues(alpha: 0.12),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: 0.2 + (_controller.value * 0.1)),
                        blurRadius: 60.0,
                        spreadRadius: 30.0,
                      ),
                    ],
                  ),
                );
              },
            ),
            // Floating Illustration Image
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.shadow.withValues(alpha: 0.15),
                      blurRadius: 24.0,
                      spreadRadius: 4.0,
                      offset: const Offset(0, 12),
                    ),
                    BoxShadow(
                      color: AppTheme.shadow.withValues(alpha: 0.1),
                      blurRadius: 8.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: widget.size * 0.85,
                    height: widget.size * 0.85,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback icon if network image fails
                      return Container(
                        width: widget.size * 0.5,
                        height: widget.size * 0.5,
                        decoration: const BoxDecoration(
                          color: AppTheme.surfaceContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.account_balance_wallet_outlined,
                          size: widget.size * 0.25,
                          color: AppTheme.primary,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: widget.size * 0.85,
                        height: widget.size * 0.85,
                        color: AppTheme.surfaceContainerHighest,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
