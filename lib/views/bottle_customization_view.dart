import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class BottleCustomizationView extends StatelessWidget {
  const BottleCustomizationView({super.key}); // Add this line

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
              // Rename to lowerCamelCase
              onColorChanged: (color) {
                // Save selected color
              },
            ),
          ],
        ),
      ),
    );
  }
}
