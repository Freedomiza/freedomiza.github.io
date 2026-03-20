class SkillStats {
  final int strength;
  final int agility;
  final int intellect;

  const SkillStats({
    required this.strength,
    required this.agility,
    required this.intellect,
  });

  factory SkillStats.fromJson(Map<String, dynamic> json) {
    return SkillStats(
      strength: json['strength'] as int? ?? 0,
      agility: json['agility'] as int? ?? 0,
      intellect: json['intellect'] as int? ?? 0,
    );
  }
}

class Skill {
  final String id;
  final String name;
  final String icon;
  final int level;
  final String levelLabel;
  final String category;
  final bool isFeatured;
  final String description;
  final SkillStats? stats;

  const Skill({
    required this.id,
    required this.name,
    required this.icon,
    required this.level,
    required this.levelLabel,
    required this.category,
    required this.isFeatured,
    required this.description,
    this.stats,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? 'code',
      level: json['level'] as int? ?? 0,
      levelLabel: json['levelLabel'] as String? ?? 'LVL 0',
      category: json['category'] as String? ?? 'secondary',
      isFeatured: json['isFeatured'] as bool? ?? false,
      description: json['description'] as String? ?? '',
      stats: json['stats'] != null
          ? SkillStats.fromJson(json['stats'] as Map<String, dynamic>)
          : null,
    );
  }
}
