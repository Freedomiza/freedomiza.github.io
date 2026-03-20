class ProjectFeature {
  final String icon;
  final String title;
  final String description;

  const ProjectFeature({
    required this.icon,
    required this.title,
    required this.description,
  });

  factory ProjectFeature.fromJson(Map<String, dynamic> json) {
    return ProjectFeature(
      icon: json['icon'] as String? ?? 'star',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );
  }
}

class ProjectStats {
  final int performance;
  final int scalability;
  final int architecture;

  const ProjectStats({
    required this.performance,
    required this.scalability,
    required this.architecture,
  });

  factory ProjectStats.fromJson(Map<String, dynamic> json) {
    return ProjectStats(
      performance: json['performance'] as int? ?? 0,
      scalability: json['scalability'] as int? ?? 0,
      architecture: json['architecture'] as int? ?? 0,
    );
  }
}

class Project {
  final String id;
  final String title;
  final String subtitle;
  final String version;
  final String category;
  final String status;
  final String statusColor;
  final List<String> techTags;
  final String description;
  final String quote;
  final List<ProjectFeature> features;
  final ProjectStats stats;
  final String duration;
  final String stakes;
  final String? imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final String? iosUrl;
  final String? androidUrl;
  final List<String> highlights;

  const Project({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.version,
    required this.category,
    required this.status,
    required this.statusColor,
    required this.techTags,
    required this.description,
    required this.quote,
    required this.features,
    required this.stats,
    required this.duration,
    required this.stakes,
    this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    this.iosUrl,
    this.androidUrl,
    required this.highlights,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      version: json['version'] as String? ?? '',
      category: json['category'] as String? ?? '',
      status: json['status'] as String? ?? '',
      statusColor: json['statusColor'] as String? ?? 'primary',
      techTags: (json['techTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      description: json['description'] as String? ?? '',
      quote: json['quote'] as String? ?? '',
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => ProjectFeature.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      stats: ProjectStats.fromJson(
          json['stats'] as Map<String, dynamic>? ?? {}),
      duration: json['duration'] as String? ?? '',
      stakes: json['stakes'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      githubUrl: json['githubUrl'] as String?,
      liveUrl: json['liveUrl'] as String?,
      iosUrl: json['iosUrl'] as String?,
      androidUrl: json['androidUrl'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }
}
