import 'package:flutter/material.dart';
import 'package:water_drink_animation_flutter/models/achievement.dart';
import '../models/water_data.dart';
import '../utilities/water_data_manager.dart';

class WaterViewModel extends ChangeNotifier {
  WaterData _waterData = WaterData(waterLevel: 0.5, dailyGoal: 2000);
  int _streak = 0;

  WaterData get waterData => _waterData;
  int get streak => _streak;

  WaterViewModel() {
    _loadWaterData();
  }

  Future<void> _loadWaterData() async {
    _waterData = await WaterDataManager.loadWaterData();
    notifyListeners();
  }

  void updateWaterLevel(double level) {
    _waterData.waterLevel = level;
    WaterDataManager.saveWaterData(_waterData);
    notifyListeners();
  }

  void updateDailyGoal(double goal) {
    _waterData.dailyGoal = goal;
    WaterDataManager.saveWaterData(_waterData);
    notifyListeners();
  }

  void updateStreak() {
    if (_waterData.waterLevel >= 1) {
      _streak++;
    } else {
      _streak = 0;
    }
    notifyListeners();
  }

  final List<Achievement> _achievements = [
    Achievement(
        title: 'First Sip', description: 'Log your first water intake.'),
    Achievement(
        title: 'Hydration Hero',
        description: 'Reach your daily goal 7 days in a row.'),
  ];

  List<Achievement> get achievements => _achievements;
}
