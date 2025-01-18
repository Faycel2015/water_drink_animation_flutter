import 'dart:math';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double waveOffset;
  final double waterLevel;

  WavePainter(this.waveOffset, this.waterLevel);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * (1 - waterLevel));

    for (double x = 0; x <= size.width; x += 5) {
      final y = size.height * (1 - waterLevel) +
          sin(x / size.width * 2 * 3.14 + waveOffset * 2 * 3.14) * 10;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return oldDelegate.waveOffset != waveOffset ||
        oldDelegate.waterLevel != waterLevel;
  }
}
