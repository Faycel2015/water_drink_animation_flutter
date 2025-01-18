import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottleColorView extends StatelessWidget {
  const BottleColorView({super.key});

  Future<Color> getSavedBottleColor() async {
    final prefs = await SharedPreferences.getInstance();
    final red =
        prefs.getInt('bottleColorRed') ?? 255; // Default to white if not found
    final green = prefs.getInt('bottleColorGreen') ?? 255;
    final blue = prefs.getInt('bottleColorBlue') ?? 255;
    final alpha = prefs.getInt('bottleColorAlpha') ?? 255;
    return Color.fromARGB(alpha, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Bottle Color'),
      ),
      body: FutureBuilder<Color>(
        future: getSavedBottleColor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No bottle color saved.'));
          } else {
            final savedBottleColor = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: savedBottleColor,
                    child: Center(
                      child: Text(
                        'Saved Bottle Color',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the bottle color customization screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottleColorCustomizationView(),
                        ),
                      );
                    },
                    child: Text('Customize Bottle Color'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class BottleColorCustomizationView extends StatelessWidget {
  const BottleColorCustomizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Bottle Color'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Your Bottle Color'),
            ColorPicker(
              onColorChanged: (color) async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('bottleColorRed', color.r as int); // Use .r
                await prefs.setInt(
                    'bottleColorGreen', color.g as int); // Use .g
                await prefs.setInt('bottleColorBlue', color.b as int); // Use .b
                await prefs.setInt(
                    'bottleColorAlpha', color.a as int); // Use .a
                debugPrint(
                    'Bottle color saved: R=${color.r}, G=${color.g}, B=${color.b}, A=${color.a}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
