import 'package:flutter/material.dart';

class CRTOverlay extends StatelessWidget {
  final Widget child;
  const CRTOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        IgnorePointer(
          child: CustomPaint(
            painter: _CRTPainter(),
            child: const SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}

class _CRTPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final scanlinePaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.06)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const lineSpacing = 3.0;
    for (double y = 0; y < size.height; y += lineSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), scanlinePaint);
    }

    // Subtle vignette effect
    final vignettePaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.2,
        colors: [
          Colors.transparent,
          Colors.black.withValues(alpha: 0.25),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      vignettePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
