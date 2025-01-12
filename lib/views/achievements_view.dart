import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/water_view_model.dart';

class AchievementsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WaterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
      ),
      body: ListView.builder(
        itemCount: viewModel.achievements.length,
        itemBuilder: (context, index) {
          final achievement = viewModel.achievements[index];
          return ListTile(
            title: Text(achievement.title),
            subtitle: Text(achievement.description),
            trailing:
                Icon(achievement.isUnlocked ? Icons.check_circle : Icons.lock),
          );
        },
      ),
    );
  }
}
