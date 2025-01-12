import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/water_view_model.dart';
import '../widgets/wave_painter.dart';
import '../widgets/celebration_view.dart';

class WaterAnimationView extends StatefulWidget {
  @override
  _WaterAnimationViewState createState() => _WaterAnimationViewState();
}

class _WaterAnimationViewState extends State<WaterAnimationView>
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
