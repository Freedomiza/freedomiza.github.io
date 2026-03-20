class Experience {
  final String id;
  final String level;
  final String levelColor;
  final String period;
  final String title;
  final String company;
  final List<String> techTags;
  final List<String> highlights;

  const Experience({
    required this.id,
    required this.level,
    required this.levelColor,
    required this.period,
    required this.title,
    required this.company,
    required this.techTags,
    required this.highlights,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'] as String? ?? '',
      level: json['level'] as String? ?? '',
      levelColor: json['levelColor'] as String? ?? 'primary',
      period: json['period'] as String? ?? '',
      title: json['title'] as String? ?? '',
      company: json['company'] as String? ?? '',
      techTags: (json['techTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      highlights: (json['highlights'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }
}
