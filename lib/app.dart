import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/work_page.dart';
import 'pages/skills_page.dart';
import 'pages/project_detail_page.dart';
import 'widgets/app_shell.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: '/work',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: WorkPage(),
          ),
        ),
        GoRoute(
          path: '/work/:id',
          pageBuilder: (context, state) {
            final id = state.pathParameters['id']!;
            return NoTransitionPage(
              child: ProjectDetailPage(projectId: id),
            );
          },
        ),
        GoRoute(
          path: '/tech',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SkillsPage(),
          ),
        ),
        GoRoute(
          path: '/labs',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LabsPlaceholderPage(),
          ),
        ),
      ],
    ),
  ],
);

class LabsPlaceholderPage extends StatelessWidget {
  const LabsPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.biotech, size: 64, color: theme.colorScheme.primary),
          const SizedBox(height: 24),
          Text(
            'LABS',
            style: theme.textTheme.displayMedium?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 8,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'COMING SOON...',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'EXPERIMENT MODE LOCKED',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KHOA LE | SENIOR MOBILE DEVELOPER',
      theme: AppTheme.darkTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
