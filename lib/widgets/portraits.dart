import 'dart:math' as math;

import 'package:flutter/material.dart';

class PersonalityCollage extends StatelessWidget {
  final double size;

  const PersonalityCollage({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CustomPaint(
        size: Size.square(size),
        painter: const _CollagePainter(),
      ),
    );
  }
}

class _CollagePainter extends CustomPainter {
  const _CollagePainter();

  static const List<Color> _backgrounds = [
    Color(0xFFEDE7F6),
    Color(0xFFFFF3E0),
    Color(0xFFE0F2F1),
    Color(0xFFFCE4EC),
    Color(0xFFE8EAF6),
    Color(0xFFFFF8E1),
    Color(0xFFE3F2FD),
    Color(0xFFF1F8E9),
    Color(0xFFF3E5F5),
  ];

  static const List<Color> _skins = [
    Color(0xFFFFE0B2),
    Color(0xFFF5D0A9),
    Color(0xFFE6B98A),
    Color(0xFFC68642),
    Color(0xFFFFD7B0),
    Color(0xFFD9A066),
    Color(0xFFF2C49B),
    Color(0xFFB97A56),
    Color(0xFFF7D3B0),
  ];

  static const List<Color> _hairs = [
    Color(0xFF3E2723),
    Color(0xFF5D4037),
    Color(0xFF212121),
    Color(0xFF6D4C41),
    Color(0xFF4E342E),
    Color(0xFF2E2E2E),
    Color(0xFF7B5E57),
    Color(0xFF1F1B18),
    Color(0xFF5A3E36),
  ];

  static const List<Color> _shirts = [
    Color(0xFFB39DDB),
    Color(0xFFFFB74D),
    Color(0xFF4DB6AC),
    Color(0xFFF06292),
    Color(0xFF7986CB),
    Color(0xFFFFD54F),
    Color(0xFF4FC3F7),
    Color(0xFFAED581),
    Color(0xFFBA68C8),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final cell = size.width / 3;
    for (var row = 0; row < 3; row++) {
      for (var col = 0; col < 3; col++) {
        final index = row * 3 + col;
        final rect = Rect.fromLTWH(col * cell, row * cell, cell, cell);
        final center = rect.center;
        canvas.drawRect(rect, Paint()..color = _backgrounds[index]);

        final shoulderRect = Rect.fromCenter(
          center: Offset(center.dx, rect.bottom - cell * 0.08),
          width: cell * 0.92,
          height: cell * 0.5,
        );
        canvas.drawOval(shoulderRect, Paint()..color = _shirts[index]);

        final headRadius = cell * 0.25;
        final headCenter = Offset(center.dx, center.dy + cell * 0.04);
        canvas.drawCircle(headCenter, headRadius, Paint()..color = _skins[index]);

        canvas.drawArc(
          Rect.fromCircle(center: headCenter, radius: headRadius * 1.04),
          math.pi,
          math.pi,
          true,
          Paint()..color = _hairs[index],
        );

        final eyePaint = Paint()..color = const Color(0xFF2B2B2B);
        final eyeY = headCenter.dy + headRadius * 0.05;
        canvas.drawCircle(
          Offset(headCenter.dx - headRadius * 0.34, eyeY),
          headRadius * 0.09,
          eyePaint,
        );
        canvas.drawCircle(
          Offset(headCenter.dx + headRadius * 0.34, eyeY),
          headRadius * 0.09,
          eyePaint,
        );

        final mouthPaint = Paint()
          ..color = const Color(0xFFB5645B)
          ..style = PaintingStyle.stroke
          ..strokeWidth = cell * 0.035
          ..strokeCap = StrokeCap.round;
        canvas.drawArc(
          Rect.fromCenter(
            center: Offset(headCenter.dx, headCenter.dy + headRadius * 0.45),
            width: headRadius * 0.7,
            height: headRadius * 0.5,
          ),
          0.15,
          math.pi - 0.3,
          false,
          mouthPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CollagePainter oldDelegate) => false;
}

class CartoonAvatar extends StatelessWidget {
  final double size;

  const CartoonAvatar({super.key, this.size = 64});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CustomPaint(
        size: Size.square(size),
        painter: const _AvatarPainter(),
      ),
    );
  }
}

class _AvatarPainter extends CustomPainter {
  const _AvatarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final centerX = width / 2;

    canvas.drawCircle(
      Offset(centerX, width / 2),
      width / 2,
      Paint()..color = const Color(0xFFE8DEF8),
    );

    final shirtPaint = Paint()..color = const Color(0xFFB39DDB);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX, width * 0.93),
        width: width * 0.86,
        height: width * 0.52,
      ),
      shirtPaint,
    );

    final headRadius = width * 0.22;
    final headCenter = Offset(centerX, width * 0.45);
    canvas.drawCircle(
      headCenter,
      headRadius,
      Paint()..color = const Color(0xFFF2C49B),
    );

    canvas.drawArc(
      Rect.fromCircle(center: headCenter, radius: headRadius * 1.06),
      math.pi,
      math.pi,
      true,
      Paint()..color = const Color(0xFF3E2723),
    );

    final eyePaint = Paint()..color = const Color(0xFF2B2B2B);
    final eyeY = headCenter.dy + headRadius * 0.08;
    canvas.drawCircle(
      Offset(headCenter.dx - headRadius * 0.34, eyeY),
      headRadius * 0.1,
      eyePaint,
    );
    canvas.drawCircle(
      Offset(headCenter.dx + headRadius * 0.34, eyeY),
      headRadius * 0.1,
      eyePaint,
    );

    final blushPaint = Paint()..color = const Color(0x55EF9A9A);
    canvas.drawCircle(
      Offset(headCenter.dx - headRadius * 0.58, headCenter.dy + headRadius * 0.28),
      headRadius * 0.16,
      blushPaint,
    );
    canvas.drawCircle(
      Offset(headCenter.dx + headRadius * 0.58, headCenter.dy + headRadius * 0.28),
      headRadius * 0.16,
      blushPaint,
    );

    final mouthPaint = Paint()
      ..color = const Color(0xFFB5645B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width * 0.025
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(headCenter.dx, headCenter.dy + headRadius * 0.42),
        width: headRadius * 0.72,
        height: headRadius * 0.5,
      ),
      0.15,
      math.pi - 0.3,
      false,
      mouthPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _AvatarPainter oldDelegate) => false;
}
