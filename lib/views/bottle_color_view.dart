import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottleColorView extends StatelessWidget {
  const BottleColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Bottle Color'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Choose Your Bottle Color'),
            ColorPicker(
              onColorChanged: (color) async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('bottleColorRed', color.red);
                await prefs.setInt('bottleColorGreen', color.green);
                await prefs.setInt('bottleColorBlue', color.blue);
                await prefs.setInt('bottleColorAlpha', color.alpha);
              },
            ),
          ],
        ),
      ),
    );
  }
}
