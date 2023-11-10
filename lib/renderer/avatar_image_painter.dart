import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AvatarImagePainter extends CustomPainter {
  final ui.Image image;
  final String text;
  final Color borderColor;

  AvatarImagePainter(
      {required this.image, required this.text, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: radius);
    final clipRRect = Path()..addOval(rect);

    canvas.save();

    var textpainter = TextPainter(
        text: TextSpan(
            text: text, style: TextStyle(fontSize: 10, color: borderColor)),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    textpainter.layout();
    Size _size = textpainter.size;
    textpainter.paint(canvas, Offset(-size.width / 2, -_size.height / 2 - 8));

    canvas.restore();

    canvas.save();
    canvas.clipPath(clipRRect);
    canvas.drawImageRect(
      image,
      Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble()),
      rect,
      paint,
    );

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, borderPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}

Future<ui.Image> loadNetImage(String path) async {
  final data = await NetworkAssetBundle(Uri.parse(path)).load(path);
  final bytes = data.buffer.asUint8List();
  final image = await decodeImageFromList(bytes);
  return image;
}
