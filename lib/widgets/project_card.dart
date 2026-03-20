import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({super.key, required this.project, this.onTap});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  Color _getStatusColor(BuildContext context) {
    switch (widget.project.statusColor) {
      case 'secondary':
        return AppColors.secondary;
      case 'tertiary':
        return AppColors.tertiary;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTap?.call();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Matrix4.translationValues(0, _isPressed ? 2 : 0, 0),
          child: Container(
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppColors.surfaceContainerHigh
                  : AppColors.surfaceContainerLow,
              border: Border.all(
                color: _isHovered ? AppColors.primary : AppColors.surfaceContainerHigh,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image area / header
                Container(
                  height: 140,
                  width: double.infinity,
                  color: AppColors.surfaceContainerLowest,
                  child: Stack(
                    children: [
                      // Decorative grid background
                      CustomPaint(
                        painter: _GridPainter(),
                        child: const SizedBox.expand(),
                      ),
                      // Version badge
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          color: AppColors.surfaceContainerHighest,
                          child: Text(
                            widget.project.version,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                      // Center icon
                      Center(
                        child: Icon(
                          Icons.terminal,
                          size: 40,
                          color: AppColors.surfaceContainerHighest,
                        ),
                      ),
                    ],
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status badge
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            color: statusColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.project.status,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Category
                      Text(
                        widget.project.category,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Title
                      Text(
                        widget.project.title,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: AppColors.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      // Tech tags
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: widget.project.techTags
                            .take(3)
                            .map(
                              (tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                color: AppColors.surfaceContainerHigh,
                                child: Text(
                                  tag,
                                  style: GoogleFonts.spaceGrotesk(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    color: AppColors.onSurface,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 12),
                      // Arrow
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: _isHovered
                                ? AppColors.primary
                                : AppColors.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.surfaceContainerHigh.withValues(alpha: 0.5)
      ..strokeWidth = 0.5;

    const spacing = 20.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
