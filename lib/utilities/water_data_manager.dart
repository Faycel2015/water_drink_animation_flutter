import 'package:shared_preferences/shared_preferences.dart';
import '../models/water_data.dart';

class WaterDataManager {
  static const String _waterDataKey = 'waterData';

  static Future<void> saveWaterData(WaterData data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('waterLevel', data.waterLevel);
    await prefs.setDouble('dailyGoal', data.dailyGoal);
  }

  static Future<WaterData> loadWaterData() async {
    final prefs = await SharedPreferences.getInstance();
    final waterLevel = prefs.getDouble('waterLevel') ?? 0.5;
    final dailyGoal = prefs.getDouble('dailyGoal') ?? 2000;
    return WaterData(waterLevel: waterLevel, dailyGoal: dailyGoal);
  }
}
