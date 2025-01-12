import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/water_view_model.dart';
import '../widgets/wave_painter.dart';

class WaterAnimationView extends StatefulWidget {
  const WaterAnimationView({super.key});

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
          ],
        ),
      ),
    );
  }
}
