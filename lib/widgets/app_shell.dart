import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'crt_overlay.dart';
import 'nav_bar.dart';

class AppShell extends StatefulWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell>
    with SingleTickerProviderStateMixin {
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  String _getCurrentRoute(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return location;
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = _getCurrentRoute(context);
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return CRTOverlay(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: _buildAppBar(context, isDesktop, currentRoute),
        ),
        body: isDesktop
            ? _buildDesktopBody(context, currentRoute)
            : _buildMobileBody(context, currentRoute),
        bottomNavigationBar: isDesktop
            ? null
            : BottomPixelNavBar(currentRoute: currentRoute),
      ),
    );
  }

  Widget _buildAppBar(
      BuildContext context, bool isDesktop, String currentRoute) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border(
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Logo
              Row(
                children: [
                  const Icon(Icons.sports_esports,
                      color: AppColors.primary, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'LEVEL_01',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // HI-SCORE
              if (isDesktop) ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'HI-SCORE',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      '999,999',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                TopPixelNavBar(currentRoute: currentRoute),
              ] else ...[
                AnimatedBuilder(
                  animation: _blinkController,
                  builder: (context, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      color: _blinkController.value > 0.5
                          ? AppColors.primaryContainer
                          : AppColors.surfaceContainerHigh,
                      child: Text(
                        'INSERT COIN',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: _blinkController.value > 0.5
                              ? AppColors.onPrimaryContainer
                              : AppColors.onSurfaceVariant,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopBody(BuildContext context, String currentRoute) {
    return Row(
      children: [
        // Main content
        Expanded(
          child: widget.child,
        ),
        // Decorative right side panel
        Container(
          width: 32,
          decoration: const BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            border: Border(
              left: BorderSide(
                  color: AppColors.surfaceContainerHigh, width: 1),
            ),
          ),
          child: RotatedBox(
            quarterTurns: 1,
            child: Center(
              child: Text(
                'PLAYER_ONE',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                  color: AppColors.surfaceContainerHighest,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileBody(BuildContext context, String currentRoute) {
    return widget.child;
  }
}
