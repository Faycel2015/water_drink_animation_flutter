import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_drink_animation_flutter/views/bottle_color_view.dart';

class BottleCustomizationView extends StatelessWidget {
  const BottleCustomizationView({super.key});

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
        title: Text('Advanced Bottle Customization'),
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
