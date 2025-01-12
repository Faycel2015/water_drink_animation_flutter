import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/water_view_model.dart';

class GoalSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WaterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Daily Goal (ml)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final goal = double.tryParse(value) ?? 2000;
                viewModel.updateDailyGoal(goal);
              },
            ),
          ],
        ),
      ),
    );
  }
}
