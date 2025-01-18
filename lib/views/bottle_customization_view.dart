import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottleCustomizationView extends StatelessWidget {
  const BottleCustomizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Bottle'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Choose Your Bottle Color'),
            ColorPicker(
              onColorChanged: (color) async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('bottleColor', color.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
