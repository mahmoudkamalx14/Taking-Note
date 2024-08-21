import 'package:flutter/material.dart';

class CaregoryModel {
  final String text;
  final Color color;
  final IconData icon;

  CaregoryModel({
    required this.text,
    required this.color,
    required this.icon,
  });
}

List<CaregoryModel> categoriesList = [
  CaregoryModel(
    text: 'Grocery',
    color: const Color(0xFFCCFF7F),
    icon: Icons.food_bank_sharp,
  ),
  CaregoryModel(
    text: 'Work',
    color: const Color(0xFFFF967F),
    icon: Icons.work_outline_outlined,
  ),
  CaregoryModel(
    text: 'Sport',
    color: const Color(0xFF7FFFFF),
    icon: Icons.sports_gymnastics_outlined,
  ),
  CaregoryModel(
    text: 'Design',
    color: const Color(0xFF7FFFD8),
    icon: Icons.category_outlined,
  ),
  CaregoryModel(
    text: 'University',
    color: const Color(0xFF7F9BFF),
    icon: Icons.school_outlined,
  ),
  CaregoryModel(
    text: 'Social',
    color: const Color(0xFFFF7FEA),
    icon: Icons.facebook_outlined,
  ),
  CaregoryModel(
    text: 'Music',
    color: const Color(0xFFFC7FFF),
    icon: Icons.music_note_outlined,
  ),
  CaregoryModel(
    text: 'Health',
    color: const Color(0xFF7FFFA3),
    icon: Icons.health_and_safety_outlined,
  ),
  CaregoryModel(
    text: 'Movie',
    color: const Color(0xFF7FD1FF),
    icon: Icons.video_camera_back_outlined,
  ),
  CaregoryModel(
    text: 'Home',
    color: const Color(0xFFFFCC7F),
    icon: Icons.home,
  ),
];
