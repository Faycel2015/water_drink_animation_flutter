import 'package:flutter/services.dart';

class HapticManager {
  static void triggerHaptic() {
    HapticFeedback.lightImpact();
  }
}
