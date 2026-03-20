import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/experience.dart';
import '../services/data_service.dart';
import '../theme/app_theme.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final _dataService = DataService();
  List<Experience> _experiences = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final experiences = await _dataService.getExperiences();
    if (mounted) {
      setState(() {
        _experiences = experiences;
        _isLoading = false;
      });
    }
  }

  Color _getLevelColor(String colorKey) {
    switch (colorKey) {
      case 'primary':
        return AppColors.primary;
      case 'secondary':
        return AppColors.secondary;
      case 'tertiary':
        return AppColors.tertiary;
      default:
        return AppColors.outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 48 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageHeader(context),
            const SizedBox(height: 40),
            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(48),
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              )
            else ...[
              _buildTimeline(context),
              const SizedBox(height: 48),
              _buildAchievements(context),
            ],
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildPageHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              color: AppColors.primary,
            ),
            const SizedBox(width: 12),
            Text(
              'EXPERIENCE TIMELINE',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: 4,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'CAREER_LOG.TXT // MISSION HISTORY',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildTimeline(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    return Column(
      children: _experiences.asMap().entries.map((entry) {
        final index = entry.key;
        final exp = entry.value;
        final levelColor = _getLevelColor(exp.levelColor);
        return _ExperienceCard(
          experience: exp,
          levelColor: levelColor,
          isFirst: index == 0,
          isLast: index == _experiences.length - 1,
          isDesktop: isDesktop,
          animDelay: (index * 100).ms,
        );
      }).toList(),
    );
  }

  Widget _buildAchievements(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    final achievements = [
      _AchievementData(
        icon: Icons.people_outline,
        title: 'TEAM LEADER',
        desc: 'LED 6+ DEVELOPER TEAMS',
      ),
      _AchievementData(
        icon: Icons.flash_on_outlined,
        title: 'PERFORMANCE',
        desc: '40% FRAME DROP REDUCTION',
      ),
      _AchievementData(
        icon: Icons.bar_chart_outlined,
        title: 'SCALE',
        desc: '500K+ USER PLATFORMS',
      ),
      _AchievementData(
        icon: Icons.verified_outlined,
        title: 'CERTIFIED',
        desc: 'HIPAA & MULTI-PLATFORM',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 20,
              color: AppColors.secondary,
            ),
            const SizedBox(width: 12),
            Text(
              'ACHIEVEMENTS UNLOCKED',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        if (isDesktop)
          Row(
            children: achievements
                .map((a) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: _AchievementCard(data: a),
                      ),
                    ))
                .toList(),
          )
        else
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: achievements
                .map((a) => SizedBox(
                      width:
                          (MediaQuery.of(context).size.width - 48 - 12) / 2,
                      child: _AchievementCard(data: a),
                    ))
                .toList(),
          ),
      ],
    ).animate().fadeIn(delay: 500.ms, duration: 400.ms);
  }
}

class _ExperienceCard extends StatelessWidget {
  final Experience experience;
  final Color levelColor;
  final bool isFirst;
  final bool isLast;
  final bool isDesktop;
  final Duration animDelay;

  const _ExperienceCard({
    required this.experience,
    required this.levelColor,
    required this.isFirst,
    required this.isLast,
    required this.isDesktop,
    required this.animDelay,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline connector
        Column(
          children: [
            // Level badge
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: levelColor.withValues(alpha: 0.15),
              child: Text(
                experience.level,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: levelColor,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 1,
                height: 40,
                color: AppColors.surfaceContainerHigh,
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Card content
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              border: Border(
                left: BorderSide(color: levelColor, width: 2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: AppColors.surfaceContainerHigh, width: 1),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              experience.period,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              experience.title.toUpperCase(),
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                color: AppColors.onSurface,
                              ),
                            ),
                            Text(
                              experience.company.toUpperCase(),
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                color: levelColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Tech tags
                if (experience.techTags.isNotEmpty)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: experience.techTags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
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
                        );
                      }).toList(),
                    ),
                  ),
                // Highlights
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: experience.highlights.map((h) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '▸ ',
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 11,
                                color: levelColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                h,
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.5,
                                  height: 1.6,
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: animDelay, duration: 400.ms).slideX(
          begin: -0.05,
          end: 0,
          delay: animDelay,
          duration: 400.ms,
        );
  }
}

class _AchievementData {
  final IconData icon;
  final String title;
  final String desc;

  const _AchievementData({
    required this.icon,
    required this.title,
    required this.desc,
  });
}

class _AchievementCard extends StatelessWidget {
  final _AchievementData data;

  const _AchievementCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        border: Border(
          top: BorderSide(color: AppColors.secondary, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(data.icon, color: AppColors.secondary, size: 24),
          const SizedBox(height: 12),
          Text(
            data.title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.desc,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
