import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    fit: StackFit.expand,
                    children: [
                      // Decorative grid background
                      CustomPaint(
                        painter: _GridPainter(),
                        child: const SizedBox.expand(),
                      ),
                      // Project image
                      if (widget.project.imageUrl != null)
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: _ProjectImage(url: widget.project.imageUrl!),
                        )
                      else
                        const Center(
                          child: Icon(
                            Icons.terminal,
                            size: 40,
                            color: AppColors.surfaceContainerHighest,
                          ),
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
                      // Demo links
                      _DemoLinks(project: widget.project),
                      const SizedBox(height: 8),
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

class _ProjectImage extends StatelessWidget {
  final String url;

  const _ProjectImage({required this.url});

  @override
  Widget build(BuildContext context) {
    final ext = url.split('.').last.toLowerCase();
    if (ext == 'svg') {
      return SvgPicture.asset(url, fit: BoxFit.contain);
    }
    return Image.asset(url, fit: BoxFit.contain);
  }
}

class _DemoLinks extends StatelessWidget {
  final Project project;

  const _DemoLinks({required this.project});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final links = <({IconData icon, String label, String url})>[];
    if (project.liveUrl != null)
      links.add((icon: Icons.language, label: 'WEB', url: project.liveUrl!));
    if (project.iosUrl != null)
      links.add((icon: Icons.phone_iphone, label: 'IOS', url: project.iosUrl!));
    if (project.androidUrl != null)
      links.add((icon: Icons.android, label: 'AND', url: project.androidUrl!));
    if (project.githubUrl != null)
      links.add((icon: Icons.code, label: 'CODE', url: project.githubUrl!));

    if (links.isEmpty) return const SizedBox.shrink();

    return Row(
      children: links.map((link) {
        return Padding(
          padding: const EdgeInsets.only(right: 6),
          child: GestureDetector(
            onTap: () => _launch(link.url),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.surfaceContainerHighest, width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(link.icon, size: 10, color: AppColors.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    link.label,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
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
