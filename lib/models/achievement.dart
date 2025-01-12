import 'package:flutter/material.dart';

class Achievement {
  String title;
  String description;
  bool isUnlocked;

  Achievement(
      {required this.title,
      required this.description,
      this.isUnlocked = false});
}
