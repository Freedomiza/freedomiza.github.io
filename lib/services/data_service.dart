import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/project.dart';
import '../models/skill.dart';
import '../models/experience.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  List<Project>? _projects;
  List<Skill>? _skills;
  List<Experience>? _experiences;
  List<Map<String, dynamic>>? _contacts;

  Future<List<Project>> getProjects() async {
    if (_projects != null) return _projects!;
    final jsonString = await rootBundle.loadString('assets/data/projects.json');
    final jsonList = json.decode(jsonString) as List<dynamic>;
    _projects = jsonList
        .map((e) => Project.fromJson(e as Map<String, dynamic>))
        .toList();
    return _projects!;
  }

  Future<Project?> getProjectById(String id) async {
    final projects = await getProjects();
    try {
      return projects.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<List<Skill>> getSkills() async {
    if (_skills != null) return _skills!;
    final jsonString = await rootBundle.loadString('assets/data/skills.json');
    final jsonList = json.decode(jsonString) as List<dynamic>;
    _skills = jsonList
        .map((e) => Skill.fromJson(e as Map<String, dynamic>))
        .toList();
    return _skills!;
  }

  Future<List<Map<String, dynamic>>> getContacts() async {
    if (_contacts != null) return _contacts!;
    final jsonString =
        await rootBundle.loadString('assets/json/contact-me.json');
    final jsonList = json.decode(jsonString) as List<dynamic>;
    _contacts = jsonList.cast<Map<String, dynamic>>();
    return _contacts!;
  }

  Future<List<Experience>> getExperiences() async {
    if (_experiences != null) return _experiences!;
    final jsonString =
        await rootBundle.loadString('assets/data/experience.json');
    final jsonList = json.decode(jsonString) as List<dynamic>;
    _experiences = jsonList
        .map((e) => Experience.fromJson(e as Map<String, dynamic>))
        .toList();
    return _experiences!;
  }
}
