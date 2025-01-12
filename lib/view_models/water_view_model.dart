import 'package:flutter/material.dart';
import '../models/water_data.dart';
import '../utilities/water_data_manager.dart';

class WaterViewModel extends ChangeNotifier {
  WaterData _waterData = WaterData(waterLevel: 0.5, dailyGoal: 2000);

  WaterData get waterData => _waterData;

  WaterViewModel() {
    _loadWaterData();
  }

  void _loadWaterData() async {
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
}