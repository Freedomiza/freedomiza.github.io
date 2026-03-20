import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class NavItem {
  final String label;
  final IconData icon;
  final String route;

  const NavItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

const _navItems = [
  NavItem(label: 'HOME', icon: Icons.home_outlined, route: '/'),
  NavItem(label: 'WORK', icon: Icons.terminal_outlined, route: '/work'),
  NavItem(label: 'TECH', icon: Icons.memory_outlined, route: '/tech'),
  NavItem(label: 'LABS', icon: Icons.biotech_outlined, route: '/labs'),
];

class BottomPixelNavBar extends StatelessWidget {
  final String currentRoute;

  const BottomPixelNavBar({super.key, required this.currentRoute});

  bool _isActive(String route) {
    if (route == '/') return currentRoute == '/';
    return currentRoute.startsWith(route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border(
          top: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: Row(
        children: _navItems.map((item) {
          final active = _isActive(item.route);
          return Expanded(
            child: _NavBarItem(
              item: item,
              isActive: active,
              onTap: () => context.go(item.route),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        transform: Matrix4.translationValues(0, _isPressed ? 1 : 0, 0),
        decoration: BoxDecoration(
          color: widget.isActive
              ? AppColors.primaryContainer
              : Colors.transparent,
          border: widget.isActive
              ? const Border(
                  top: BorderSide(color: AppColors.primary, width: 2),
                )
              : null,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.item.icon,
              size: 20,
              color: widget.isActive
                  ? AppColors.onPrimaryContainer
                  : AppColors.onSurfaceVariant,
            ),
            const SizedBox(height: 4),
            Text(
              widget.item.label,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: widget.isActive
                    ? AppColors.onPrimaryContainer
                    : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopPixelNavBar extends StatelessWidget {
  final String currentRoute;

  const TopPixelNavBar({super.key, required this.currentRoute});

  bool _isActive(String route) {
    if (route == '/') return currentRoute == '/';
    return currentRoute.startsWith(route);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _navItems.map((item) {
        final active = _isActive(item.route);
        return _TopNavItem(
          item: item,
          isActive: active,
          onTap: () => context.go(item.route),
        );
      }).toList(),
    );
  }
}

class _TopNavItem extends StatefulWidget {
  final NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _TopNavItem({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_TopNavItem> createState() => _TopNavItemState();
}

class _TopNavItemState extends State<_TopNavItem> {
  bool _isHovered = false;
  bool _isPressed = false;

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
          transform: Matrix4.translationValues(0, _isPressed ? 1 : 0, 0),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppColors.primaryContainer
                : _isHovered
                    ? AppColors.surfaceContainerHigh
                    : Colors.transparent,
            border: widget.isActive
                ? const Border(
                    bottom: BorderSide(color: AppColors.primary, width: 2),
                  )
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.item.icon,
                size: 14,
                color: widget.isActive
                    ? AppColors.onPrimaryContainer
                    : _isHovered
                        ? AppColors.onSurface
                        : AppColors.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                widget.item.label,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: widget.isActive
                      ? AppColors.onPrimaryContainer
                      : _isHovered
                          ? AppColors.onSurface
                          : AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
