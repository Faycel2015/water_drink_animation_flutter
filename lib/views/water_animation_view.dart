import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/water_view_model.dart';
import '../widgets/wave_painter.dart';
import '../widgets/celebration_view.dart';

class WaterAnimationView extends StatefulWidget {
  const WaterAnimationView({super.key});

  @override
  WaterAnimationViewState createState() => WaterAnimationViewState();
}

class WaterAnimationViewState extends State<WaterAnimationView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WaterViewModel>(context);

    if (viewModel.waterData.waterLevel >= 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: CelebrationView(),
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Water Drink Animation'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Open a settings menu or drawer for navigation
              showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.color_lens),
                      title: Text('Customize Water Color'),
                      onTap: () {
                        Navigator.pop(context); // Close the menu
                        Navigator.pushNamed(context, '/waterColor');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.color_lens_outlined),
                      title: Text('Customize Bottle Color'),
                      onTap: () {
                        Navigator.pop(context); // Close the menu
                        Navigator.pushNamed(context, '/bottleColor');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.build),
                      title: Text('Advanced Bottle Customization'),
                      onTap: () {
                        Navigator.pop(context); // Close the menu
                        Navigator.pushNamed(context, '/bottleCustomization');
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: Size(200, 200),
              painter: WavePainter(
                  _controller.value, viewModel.waterData.waterLevel),
            ),
            Slider(
              value: viewModel.waterData.waterLevel,
              onChanged: (value) {
                viewModel.updateWaterLevel(value);
              },
            ),
            Text(
                '${(viewModel.waterData.waterLevel * 100).toStringAsFixed(0)}%'),
            Text('Streak: ${viewModel.streak} days'),
          ],
        ),
      ),
    );
  }
}
