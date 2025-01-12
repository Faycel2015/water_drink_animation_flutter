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


@override
  Builder(context, themeManager, child) {
    return MaterialApp(
      title: 'Water Drink Animation',
      theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeManager.themeMode,
      home: WaterAnimationView(),
    );
  }
  }
