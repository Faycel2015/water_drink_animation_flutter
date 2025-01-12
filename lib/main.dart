import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/water_view_model.dart';
import 'views/water_animation_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WaterViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Drink Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WaterAnimationView(),
    );
  }
}
