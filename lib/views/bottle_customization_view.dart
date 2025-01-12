import 'package:flutter/material.dart';

class BottleCustomizationView extends StatelessWidget {
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

ColorPicker({required Null Function(dynamic color) onColorChanged}) {}
