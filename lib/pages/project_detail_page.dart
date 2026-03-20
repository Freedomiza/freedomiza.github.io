import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/project.dart';
import '../services/data_service.dart';
import '../theme/app_theme.dart';
import '../widgets/pixel_progress_bar.dart';

class ProjectDetailPage extends StatefulWidget {
  final String projectId;

  const ProjectDetailPage({super.key, required this.projectId});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final _dataService = DataService();
  Project? _project;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final project = await _dataService.getProjectById(widget.projectId);
    if (mounted) {
      setState(() {
        _project = project;
        _isLoading = false;
      });
    }
  }

  Color _getStatusColor() {
    switch (_project?.statusColor) {
      case 'secondary':
        return AppColors.secondary;
      case 'tertiary':
        return AppColors.tertiary;
      default:
        return AppColors.primary;
    }
  }

  IconData _getFeatureIcon(String iconName) {
    switch (iconName) {
      case 'bolt':
        return Icons.bolt;
      case 'shield':
        return Icons.shield_outlined;
      case 'extension':
        return Icons.extension_outlined;
      case 'stars':
        return Icons.stars_outlined;
      case 'speed':
        return Icons.speed;
      case 'security':
        return Icons.security;
      default:
        return Icons.star_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (_project == null) {
      return _buildNotFound(context);
    }

    return _buildContent(context);
  }

  Widget _buildNotFound(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: AppColors.primary),
          const SizedBox(height: 16),
          Text(
            'MISSION NOT FOUND',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 4,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 24),
          _PixelButton(
            label: '◀  BACK TO BASE',
            onTap: () => context.go('/work'),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final project = _project!;
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    final statusColor = _getStatusColor();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero section
          _buildHero(context, project, statusColor, isDesktop),
          // Body
          Padding(
            padding: EdgeInsets.all(isDesktop ? 48 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _buildDescription(context, project)),
                      const SizedBox(width: 32),
                      Expanded(flex: 2, child: _buildStats(context, project)),
                    ],
                  )
                else ...[
                  _buildDescription(context, project),
                  const SizedBox(height: 24),
                  _buildStats(context, project),
                ],
                const SizedBox(height: 40),
                if (project.features.isNotEmpty) ...[
                  _buildFeatures(context, project, isDesktop),
                  const SizedBox(height: 40),
                ],
                _buildImageArea(context),
                const SizedBox(height: 40),
                _buildHighlights(context, project),
                const SizedBox(height: 40),
                _buildFooter(context, project),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context, Project project, Color statusColor,
      bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 48 : 24),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border(
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          _BackButton(onTap: () => context.go('/work')),
          const SizedBox(height: 24),
          // Header row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          color: statusColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          project.status,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      project.title,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: isDesktop ? 40 : 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      project.subtitle,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              // Meta
              Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.surfaceContainerLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _MetaRow(label: 'VERSION', value: project.version),
                    const SizedBox(height: 8),
                    _MetaRow(label: 'DURATION', value: project.duration),
                    const SizedBox(height: 8),
                    _MetaRow(label: 'STAKES', value: project.stakes),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Tech tags
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: project.techTags.map((tag) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                color: AppColors.surfaceContainerHigh,
                child: Text(
                  tag,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: AppColors.onSurface,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildDescription(BuildContext context, Project project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 18, color: AppColors.primary),
            const SizedBox(width: 10),
            Text(
              'MISSION BRIEFING',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          project.description,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            height: 1.8,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 24),
        // Quote
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.surfaceContainerLow,
            border: Border(
              left: BorderSide(color: AppColors.primary, width: 3),
            ),
          ),
          child: Text(
            '"${project.quote}"',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              height: 1.7,
              fontStyle: FontStyle.italic,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 100.ms, duration: 400.ms);
  }

  Widget _buildStats(BuildContext context, Project project) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        border: Border(
          top: BorderSide(color: AppColors.secondary, width: 2),
          left: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          right: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MISSION STATS',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          PixelProgressBar(
            label: 'PERFORMANCE',
            levelLabel: '${project.stats.performance}%',
            value: project.stats.performance,
            color: AppColors.primary,
          ),
          const SizedBox(height: 12),
          PixelProgressBar(
            label: 'SCALABILITY',
            levelLabel: '${project.stats.scalability}%',
            value: project.stats.scalability,
            color: AppColors.secondary,
          ),
          const SizedBox(height: 12),
          PixelProgressBar(
            label: 'ARCHITECTURE',
            levelLabel: '${project.stats.architecture}%',
            value: project.stats.architecture,
            color: AppColors.tertiary,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 400.ms);
  }

  Widget _buildFeatures(
      BuildContext context, Project project, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 18, color: AppColors.tertiary),
            const SizedBox(width: 10),
            Text(
              'POWER-UPS EQUIPPED',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final cols = isDesktop ? 4 : 2;
            final itemWidth =
                (constraints.maxWidth - (cols - 1) * 12) / cols;
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: project.features.asMap().entries.map((entry) {
                final i = entry.key;
                final feature = entry.value;
                return SizedBox(
                  width: itemWidth,
                  child: _FeatureCard(
                    feature: feature,
                    icon: _getFeatureIcon(feature.icon),
                  )
                      .animate()
                      .fadeIn(
                          delay: (300 + i * 80).ms, duration: 300.ms)
                      .slideY(
                          begin: 0.1,
                          end: 0,
                          delay: (300 + i * 80).ms,
                          duration: 300.ms),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildImageArea(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: AppColors.surfaceContainerLowest,
      child: Stack(
        children: [
          CustomPaint(
            painter: _GridBgPainter(),
            child: const SizedBox.expand(),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 40,
                  color: AppColors.surfaceContainerHighest,
                ),
                const SizedBox(height: 8),
                Text(
                  'SCREENSHOT_LOADING...',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: AppColors.surfaceContainerHighest,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlights(BuildContext context, Project project) {
    if (project.highlights.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 18, color: AppColors.primary),
            const SizedBox(width: 10),
            Text(
              'KEY ACCOMPLISHMENTS',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...project.highlights.asMap().entries.map((entry) {
          final i = entry.key;
          final h = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  color: AppColors.primaryContainer,
                  child: Center(
                    child: Text(
                      '${i + 1}',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    h,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      height: 1.7,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: (400 + i * 100).ms, duration: 300.ms);
        }),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, Project project) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border(
          top: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: Row(
        children: [
          _PixelButton(
            label: '◀  BACK TO WORK',
            onTap: () => context.go('/work'),
          ),
          const Spacer(),
          if (project.githubUrl != null)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: _PixelButton(
                label: 'GITHUB',
                onTap: () {},
                isPrimary: false,
              ),
            ),
          if (project.liveUrl != null)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: _PixelButton(
                label: 'LIVE DEMO',
                onTap: () {},
                isPrimary: true,
              ),
            ),
        ],
      ),
    ).animate().fadeIn(delay: 600.ms, duration: 400.ms);
  }
}

class _FeatureCard extends StatelessWidget {
  final ProjectFeature feature;
  final IconData icon;

  const _FeatureCard({required this.feature, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        border: Border(
          top: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          left: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          right: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(height: 10),
          Text(
            feature.title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            feature.description,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              height: 1.5,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  final String label;
  final String value;

  const _MetaRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: AppColors.onSurface,
          ),
        ),
      ],
    );
  }
}

class _BackButton extends StatefulWidget {
  final VoidCallback onTap;

  const _BackButton({required this.onTap});

  @override
  State<_BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<_BackButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back,
              size: 14,
              color: _isHovered ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Text(
              'BACK TO MISSIONS',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                color:
                    _isHovered ? AppColors.primary : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PixelButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  const _PixelButton({
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  State<_PixelButton> createState() => _PixelButtonState();
}

class _PixelButtonState extends State<_PixelButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 80),
          transform: Matrix4.translationValues(0, _isPressed ? 2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered
                    ? AppColors.primaryContainer.withValues(alpha: 0.8)
                    : AppColors.primaryContainer)
                : (_isHovered
                    ? AppColors.surfaceContainerHigh
                    : AppColors.surfaceContainerLow),
            border: widget.isPrimary
                ? null
                : Border.all(
                    color: _isHovered
                        ? AppColors.primary
                        : AppColors.surfaceContainerHigh,
                    width: 1),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
              color: widget.isPrimary
                  ? AppColors.onPrimaryContainer
                  : _isHovered
                      ? AppColors.primary
                      : AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class _GridBgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.surfaceContainerHigh.withValues(alpha: 0.4)
      ..strokeWidth = 0.5;

    const spacing = 24.0;
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
