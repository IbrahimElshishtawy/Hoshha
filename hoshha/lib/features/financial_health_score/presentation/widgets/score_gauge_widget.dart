import 'package:flutter/material.dart';
import 'dart:math';

class ScoreGaugeWidget extends StatelessWidget {
  final int score;
  final String statusText;

  const ScoreGaugeWidget({
    super.key,
    required this.score,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(220, 220),
            painter: _GaugePainter(
              score: score,
              backgroundColor: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.3),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$score/100',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final int score;
  final Color backgroundColor;
  final Color activeColor;

  _GaugePainter({
    required this.score,
    required this.backgroundColor,
    required this.activeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 16;
    
    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    final activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    // Draw full background circle (with a gap at bottom if needed, here we draw a full circle)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      _degreesToRadians(135),
      _degreesToRadians(270),
      false,
      bgPaint,
    );

    // Draw active score arc
    final sweepAngle = _degreesToRadians((score / 100) * 270);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      _degreesToRadians(135),
      sweepAngle,
      false,
      activePaint,
    );
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
