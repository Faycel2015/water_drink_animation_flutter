import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_drink_animation_flutter/views/water_animation_view.dart';
import 'view_models/water_view_model.dart';
import 'views/welcome_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WaterViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Add const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Drink Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeView(),
      routes: {
        '/home': (context) => WaterAnimationView(),
      },
    );
  }
}
