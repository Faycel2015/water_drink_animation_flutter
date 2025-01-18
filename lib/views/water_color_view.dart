import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterColorView extends StatelessWidget {
  const WaterColorView({super.key});

  // Method to retrieve the saved water color
  Future<Color> getSavedWaterColor() async {
    final prefs = await SharedPreferences.getInstance();
    final red =
        prefs.getInt('waterColorRed') ?? 255; // Default to white if not found
    final green = prefs.getInt('waterColorGreen') ?? 255;
    final blue = prefs.getInt('waterColorBlue') ?? 255;
    final alpha = prefs.getInt('waterColorAlpha') ?? 255;
    print('Water color retrieved: R=$red, G=$green, B=$blue, A=$alpha');
    return Color.fromARGB(alpha, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Water Color'),
      ),
      body: FutureBuilder<Color>(
        future: getSavedWaterColor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No water color saved.'));
          } else {
            final savedWaterColor = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: savedWaterColor,
                    child: Center(
                      child: Text(
                        'Saved Water Color',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the water color customization screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WaterColorCustomizationView(),
                        ),
                      );
                    },
                    child: Text('Customize Water Color'),
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

class WaterColorCustomizationView extends StatelessWidget {
  const WaterColorCustomizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Water Color'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Your Water Color'),
            ColorPicker(
              onColorChanged: (color) async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('waterColorRed', color.red);
                await prefs.setInt('waterColorGreen', color.green);
                await prefs.setInt('waterColorBlue', color.blue);
                await prefs.setInt('waterColorAlpha', color.alpha);
                print(
                    'Water color saved: R=${color.red}, G=${color.green}, B=${color.blue}, A=${color.alpha}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
