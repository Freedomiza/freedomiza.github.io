import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../services/data_service.dart';
import '../theme/app_theme.dart';
import '../widgets/project_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _dataService = DataService();
  List<Project> _projects = [];
  List<Map<String, dynamic>> _contacts = [];
  bool _isLoading = true;
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
    _loadData();
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final results = await Future.wait([
      _dataService.getProjects(),
      _dataService.getContacts(),
    ]);
    if (mounted) {
      setState(() {
        _projects = results[0] as List<Project>;
        _contacts = results[1] as List<Map<String, dynamic>>;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroSection(context),
          _buildStatsRow(context),
          _buildCtaSection(context),
          _buildProjectsSection(context),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border(
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: isDesktop ? _buildDesktopHero(context) : _buildMobileHero(context),
    );
  }

  Widget _buildDesktopHero(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _buildHeroContent(context),
          ),
          const SizedBox(width: 64),
          Expanded(
            flex: 2,
            child: _buildPortraitPlaceholder(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHero(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPortraitPlaceholder(context, height: 200),
          const SizedBox(height: 32),
          _buildHeroContent(context),
        ],
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Eyebrow
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          color: AppColors.primaryContainer,
          child: Text(
            'SENIOR MOBILE DEVELOPER',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
              color: AppColors.onPrimaryContainer,
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 300.ms)
            .slideX(begin: -0.2, end: 0, duration: 300.ms),
        const SizedBox(height: 20),
        // Main name
        Text(
          'KHOA',
          style: GoogleFonts.spaceGrotesk(
            fontSize: MediaQuery.of(context).size.width >= 768 ? 80 : 56,
            fontWeight: FontWeight.w700,
            letterSpacing: 4,
            height: 0.9,
            color: AppColors.onSurface,
          ),
        )
            .animate()
            .fadeIn(delay: 100.ms, duration: 400.ms)
            .slideY(begin: 0.1, end: 0, delay: 100.ms, duration: 400.ms),
        Text(
          'LE.',
          style: GoogleFonts.spaceGrotesk(
            fontSize: MediaQuery.of(context).size.width >= 768 ? 80 : 56,
            fontWeight: FontWeight.w700,
            letterSpacing: 4,
            height: 0.9,
            color: AppColors.primary,
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 400.ms)
            .slideY(begin: 0.1, end: 0, delay: 200.ms, duration: 400.ms),
        const SizedBox(height: 24),
        // Tagline
        Text(
          'CRAFTING PIXEL-PERFECT MOBILE EXPERIENCES\nACROSS IOS, ANDROID & WEB PLATFORMS.',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            height: 1.8,
            color: AppColors.onSurfaceVariant,
          ),
        ).animate().fadeIn(delay: 300.ms, duration: 400.ms),
        const SizedBox(height: 32),
        // Action buttons
        Row(
          children: [
            _PixelButton(
              label: 'VIEW WORK',
              isPrimary: true,
              onTap: () => context.go('/work'),
            ),
            const SizedBox(width: 12),
            _PixelButton(
              label: 'CONTACT',
              isPrimary: false,
              onTap: () => _showContactModal(context),
            ),
          ],
        ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
      ],
    );
  }

  void _showContactModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _ContactModal(contacts: _contacts),
    );
  }

  Widget _buildPortraitPlaceholder(BuildContext context, {double? height}) {
    return Container(
      height: height ?? 320,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        border: Border.all(
          color: AppColors.surfaceContainerHighest,
          width: 1,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Profile image
          Assets.images.profile.image(
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
          // Color filter overlay — retro red tint
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //       colors: [
          //         AppColors.primaryContainer.withValues(alpha: 0.25),
          //         AppColors.primaryContainer.withValues(alpha: 0.55),
          //         Colors.black.withValues(alpha: 0.75),
          //       ],
          //       stops: const [0.0, 0.5, 1.0],
          //     ),
          //   ),
          // ),
          // Grid overlay
          CustomPaint(
            painter: _PortraitGridPainter(),
            child: const SizedBox.expand(),
          ),
          // Text label at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: AppColors.background.withValues(alpha: 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    color: AppColors.primaryContainer,
                    child: Text(
                      'PLAYER_ONE',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3,
                        color: AppColors.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'KHOA LE.',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'SENIOR MOBILE DEVELOPER',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 500.ms);
  }

  Widget _buildStatsRow(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainer,
        border: Border(
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: isDesktop
          ? Row(
              children: [
                Expanded(child: _StatItem(value: '12+', label: 'YRS EXP')),
                _VertDivider(),
                Expanded(
                    child: _StatItem(
                        value: _projects.length.toString() + '+',
                        label: 'PROJECTS')),
                _VertDivider(),
                Expanded(
                    child: _StatItem(value: 'iOS/AND/WEB', label: 'PLATFORMS')),
                _VertDivider(),
                Expanded(
                    child: _StatItem(
                        value: 'OPEN',
                        label: 'STATUS',
                        valueColor: AppColors.primary,
                        showPulse: true)),
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _StatItem(value: '12+', label: 'YRS EXP')),
                    _VertDivider(),
                    Expanded(
                        child: _StatItem(
                            value: _projects.length.toString(),
                            label: 'PROJECTS')),
                  ],
                ),
                const Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.surfaceContainerHigh),
                Row(
                  children: [
                    Expanded(
                        child: _StatItem(value: 'iOS/AND', label: 'PLATFORMS')),
                    _VertDivider(),
                    Expanded(
                        child: _StatItem(
                            value: 'OPEN',
                            label: 'STATUS',
                            valueColor: AppColors.primary,
                            showPulse: true)),
                  ],
                ),
              ],
            ),
    ).animate().fadeIn(delay: 500.ms, duration: 400.ms);
  }

  Widget _buildCtaSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: Column(
        children: [
          Text(
            'READY TO PLAY?',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: 4,
              color: AppColors.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'INSERT YOUR COIN AND PRESS START TO EXPLORE MY WORK',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _PixelButton(
            label: '▶  PRESS START',
            isPrimary: true,
            onTap: () => context.go('/work'),
            large: true,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 600.ms, duration: 400.ms);
  }

  Widget _buildProjectsSection(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    return Padding(
      padding: EdgeInsets.all(isDesktop ? 48 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: 12),
              Text(
                'FEATURED MISSIONS',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                  color: AppColors.onSurface,
                ),
              ),
              const Spacer(),
              _PixelButton(
                label: 'VIEW ALL',
                isPrimary: false,
                onTap: () => context.go('/work'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(48),
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            )
          else
            isDesktop ? _buildDesktopGrid(context) : _buildMobileList(context),
        ],
      ),
    ).animate().fadeIn(delay: 700.ms, duration: 400.ms);
  }

  Widget _buildDesktopGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1100 ? 3 : 2;
        final itemWidth =
            (constraints.maxWidth - (crossAxisCount - 1) * 16) / crossAxisCount;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: _projects.map((project) {
            return SizedBox(
              width: itemWidth,
              child: ProjectCard(
                project: project,
                onTap: () => context.go('/work/${project.id}'),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildMobileList(BuildContext context) {
    return Column(
      children: _projects.map((project) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ProjectCard(
            project: project,
            onTap: () => context.go('/work/${project.id}'),
          ),
        );
      }).toList(),
    );
  }
}

class _VertDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 60,
      color: AppColors.surfaceContainerHigh,
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;
  final bool showPulse;

  const _StatItem({
    required this.value,
    required this.label,
    this.valueColor = AppColors.onSurface,
    this.showPulse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showPulse) ...[
                _PulsingDot(),
                const SizedBox(width: 8),
              ],
              Text(
                value,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: valueColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 8,
          height: 8,
          color: _controller.value > 0.5
              ? AppColors.primary
              : AppColors.primaryContainer,
        );
      },
    );
  }
}

class _PixelButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;
  final bool large;

  const _PixelButton({
    required this.label,
    required this.isPrimary,
    required this.onTap,
    this.large = false,
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
          padding: EdgeInsets.symmetric(
            horizontal: widget.large ? 32 : 20,
            vertical: widget.large ? 16 : 10,
          ),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered
                    ? AppColors.primaryContainer.withValues(alpha: 0.8)
                    : AppColors.primaryContainer)
                : (_isHovered
                    ? AppColors.surfaceContainerHigh
                    : Colors.transparent),
            border: widget.isPrimary
                ? null
                : Border.all(color: AppColors.primary, width: 1),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: widget.large ? 14 : 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
              color: widget.isPrimary
                  ? AppColors.onPrimaryContainer
                  : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactModal extends StatelessWidget {
  final List<Map<String, dynamic>> contacts;

  const _ContactModal({required this.contacts});

  IconData _iconFor(String name) {
    switch (name.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.work_outline;
      case 'telegram':
        return Icons.send_outlined;
      default:
        return Icons.link;
    }
  }

  Future<void> _open(String href) async {
    final uri = Uri.parse(href);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 360,
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          border:
              Border.all(color: AppColors.surfaceContainerHighest, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: AppColors.primaryContainer,
              child: Row(
                children: [
                  Text(
                    'CONTACT_ME',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                      color: AppColors.onPrimaryContainer,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: AppColors.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            // Contact items
            ...contacts.map((contact) {
              final name = contact['name'] as String? ?? '';
              final href = contact['href'] as String? ?? '';
              return _ContactRow(
                name: name,
                href: href,
                icon: _iconFor(name),
                onTap: () => _open(href),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatefulWidget {
  final String name;
  final String href;
  final IconData icon;
  final VoidCallback onTap;

  const _ContactRow({
    required this.name,
    required this.href,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<_ContactRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.surfaceContainerHigh
                : Colors.transparent,
            border: const Border(
              bottom:
                  BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                color: _isHovered
                    ? AppColors.primaryContainer
                    : AppColors.surfaceContainer,
                child: Icon(
                  widget.icon,
                  size: 15,
                  color: _isHovered
                      ? AppColors.onPrimaryContainer
                      : AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name.toUpperCase(),
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.href,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                        color: AppColors.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 14,
                color:
                    _isHovered ? AppColors.primary : AppColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PortraitGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.surfaceContainerHighest.withValues(alpha: 0.5)
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
