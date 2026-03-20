import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class PixelProgressBar extends StatelessWidget {
  final String label;
  final String levelLabel;
  final int value; // 0-100
  final Color color;
  final double height;
  final bool showLabel;
  final bool showValue;

  const PixelProgressBar({
    super.key,
    required this.label,
    required this.levelLabel,
    required this.value,
    this.color = AppColors.primary,
    this.height = 12,
    this.showLabel = true,
    this.showValue = true,
  });

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0, 100);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label.toUpperCase(),
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              if (showValue)
                Text(
                  levelLabel,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: color,
                  ),
                ),
            ],
          ),
        if (showLabel) const SizedBox(height: 6),
        SizedBox(
          height: height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final filledWidth = totalWidth * (clampedValue / 100);
              return Stack(
                children: [
                  // Background track
                  Container(
                    width: totalWidth,
                    height: height,
                    color: AppColors.surfaceContainerHigh,
                  ),
                  // Filled portion
                  Container(
                    width: filledWidth,
                    height: height,
                    color: color,
                  ),
                  // Segment lines for pixel effect
                  ...List.generate(
                    (totalWidth / 8).floor(),
                    (i) => Positioned(
                      left: (i + 1) * 8.0 - 1,
                      top: 0,
                      child: Container(
                        width: 1,
                        height: height,
                        color: AppColors.background.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class PixelStatBar extends StatelessWidget {
  final String label;
  final int value; // 0-255
  final Color color;

  const PixelStatBar({
    super.key,
    required this.label,
    required this.value,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (value / 255 * 100).round();
    return PixelProgressBar(
      label: label,
      levelLabel: '$value',
      value: percent,
      color: color,
      height: 8,
    );
  }
}
