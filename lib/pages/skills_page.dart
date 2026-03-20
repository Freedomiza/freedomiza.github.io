import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/skill.dart';
import '../services/data_service.dart';
import '../theme/app_theme.dart';
import '../widgets/pixel_progress_bar.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final _dataService = DataService();
  List<Skill> _skills = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final skills = await _dataService.getSkills();
    if (mounted) {
      setState(() {
        _skills = skills;
        _isLoading = false;
      });
    }
  }

  Skill? get _featuredSkill {
    try {
      return _skills.firstWhere((s) => s.isFeatured);
    } catch (_) {
      return _skills.isNotEmpty ? _skills.first : null;
    }
  }

  List<Skill> get _otherSkills {
    return _skills.where((s) => !s.isFeatured).toList();
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
            const SizedBox(height: 32),
            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(48),
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              )
            else ...[
              if (isDesktop)
                _buildDesktopLayout(context)
              else
                _buildMobileLayout(context),
              const SizedBox(height: 32),
              _buildInventoryFooter(context),
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
              'SKILL INVENTORY',
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
            'EQUIPMENT_LOADOUT.JSON // ACTIVE STACK',
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

  Widget _buildDesktopLayout(BuildContext context) {
    final featured = _featuredSkill;
    final others = _otherSkills;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: featured skill + stats
        Expanded(
          flex: 5,
          child: Column(
            children: [
              if (featured != null)
                _FeaturedSkillCard(skill: featured)
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 400.ms),
              const SizedBox(height: 16),
              if (featured?.stats != null)
                _StatsCard(skill: featured!)
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 400.ms),
            ],
          ),
        ),
        const SizedBox(width: 24),
        // Right: other skills grid
        Expanded(
          flex: 7,
          child: _buildSkillsGrid(context, others),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    final featured = _featuredSkill;
    final others = _otherSkills;
    return Column(
      children: [
        if (featured != null)
          _FeaturedSkillCard(skill: featured)
              .animate()
              .fadeIn(delay: 100.ms, duration: 400.ms),
        const SizedBox(height: 16),
        if (featured?.stats != null)
          _StatsCard(skill: featured!)
              .animate()
              .fadeIn(delay: 200.ms, duration: 400.ms),
        const SizedBox(height: 24),
        _buildSkillsGrid(context, others),
      ],
    );
  }

  Widget _buildSkillsGrid(BuildContext context, List<Skill> skills) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 16,
              color: AppColors.secondary,
            ),
            const SizedBox(width: 8),
            Text(
              'ARSENAL',
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
            final cols = isDesktop ? 2 : 1;
            final itemWidth = cols > 1
                ? (constraints.maxWidth - 12) / cols
                : constraints.maxWidth;
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: skills.asMap().entries.map((entry) {
                final i = entry.key;
                final skill = entry.value;
                return SizedBox(
                  width: itemWidth,
                  child: _SkillCard(skill: skill)
                      .animate()
                      .fadeIn(
                          delay: (300 + i * 80).ms, duration: 300.ms)
                      .slideY(
                          begin: 0.05,
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

  Widget _buildInventoryFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
            height: 1, thickness: 1, color: AppColors.surfaceContainerHigh),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 4,
              height: 16,
              color: AppColors.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Text(
              'INVENTORY SLOTS',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(8, (i) {
            final isOccupied = i < _skills.length;
            return Expanded(
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: isOccupied
                      ? AppColors.surfaceContainerHigh
                      : AppColors.surfaceContainerLowest,
                  border: Border.all(
                    color: isOccupied
                        ? AppColors.surfaceContainerHighest
                        : AppColors.surfaceContainerHigh,
                    width: 1,
                  ),
                ),
                child: isOccupied
                    ? Center(
                        child: Icon(
                          Icons.code,
                          size: 16,
                          color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                        ),
                      )
                    : Center(
                        child: Text(
                          '—',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 10,
                            color: AppColors.surfaceContainerHighest,
                          ),
                        ),
                      ),
              ),
            );
          }),
        ),
      ],
    ).animate().fadeIn(delay: 600.ms, duration: 400.ms);
  }
}

class _FeaturedSkillCard extends StatelessWidget {
  final Skill skill;

  const _FeaturedSkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        border: Border(
          top: BorderSide(color: AppColors.primary, width: 2),
          left: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          right: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          bottom: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              border: Border(
                bottom: BorderSide(
                    color: AppColors.surfaceContainerHigh, width: 1),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  color: AppColors.primaryContainer,
                  child: Text(
                    'EQUIPPED',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: AppColors.onPrimaryContainer,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  skill.levelLabel,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: AppColors.primary,
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
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      color: AppColors.surfaceContainerHigh,
                      child: const Icon(
                        Icons.flutter_dash,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          skill.name.toUpperCase(),
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                            color: AppColors.onSurface,
                          ),
                        ),
                        Text(
                          skill.category.toUpperCase(),
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                PixelProgressBar(
                  label: 'PROFICIENCY',
                  levelLabel: skill.levelLabel,
                  value: skill.level,
                  color: AppColors.primary,
                  height: 16,
                ),
                const SizedBox(height: 16),
                Text(
                  skill.description,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    height: 1.7,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final Skill skill;

  const _StatsCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    final stats = skill.stats!;
    return Container(
      width: double.infinity,
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
            'EQUIPMENT_STATS',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          PixelStatBar(
            label: 'STRENGTH',
            value: stats.strength,
            color: AppColors.primary,
          ),
          const SizedBox(height: 12),
          PixelStatBar(
            label: 'AGILITY',
            value: stats.agility,
            color: AppColors.secondary,
          ),
          const SizedBox(height: 12),
          PixelStatBar(
            label: 'INTELLECT',
            value: stats.intellect,
            color: AppColors.tertiary,
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Skill skill;

  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  Color _getCategoryColor() {
    switch (widget.skill.category) {
      case 'primary':
        return AppColors.primary;
      case 'secondary':
        return AppColors.secondary;
      case 'tertiary':
        return AppColors.tertiary;
      default:
        return AppColors.onSurfaceVariant;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = _getCategoryColor();
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.surfaceContainerHigh
              : AppColors.surfaceContainerLow,
          border: Border(
            left: BorderSide(color: categoryColor, width: 2),
            top: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
            right: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
            bottom:
                BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.skill.name.toUpperCase(),
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: AppColors.onSurface,
                  ),
                ),
                const Spacer(),
                Text(
                  widget.skill.levelLabel,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: categoryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            PixelProgressBar(
              label: '',
              levelLabel: widget.skill.levelLabel,
              value: widget.skill.level,
              color: categoryColor,
              height: 8,
              showLabel: false,
              showValue: false,
            ),
            if (widget.skill.description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                widget.skill.description,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  height: 1.5,
                  color: AppColors.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
