import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Alien Head Avatar Painter
class AlienAvatar extends StatelessWidget {
  final double size;

  const AlienAvatar({super.key, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF4A4A4A),
        border: Border.all(color: Colors.white, width: 1.2),
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.65, size * 0.65),
          painter: _AlienHeadPainter(),
        ),
      ),
    );
  }
}

class _AlienHeadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Head outline & fill
    final headPaint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..style = PaintingStyle.fill;

    final headBorder = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final headPath = Path();
    // Oval-ish alien head shape (wider at top, narrower at chin)
    headPath.moveTo(w * 0.5, 0);
    headPath.cubicTo(w * 0.95, 0, w * 1.0, h * 0.45, w * 0.68, h * 0.88);
    headPath.cubicTo(w * 0.58, h * 1.0, w * 0.42, h * 1.0, w * 0.32, h * 0.88);
    headPath.cubicTo(0, h * 0.45, w * 0.05, 0, w * 0.5, 0);
    headPath.close();

    canvas.drawPath(headPath, headPaint);
    canvas.drawPath(headPath, headBorder);

    // Eyes
    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Left Eye (tilted)
    canvas.save();
    canvas.translate(w * 0.35, h * 0.45);
    canvas.rotate(-math.pi / 6);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: w * 0.22, height: h * 0.32),
      eyePaint,
    );
    canvas.restore();

    // Right Eye (tilted)
    canvas.save();
    canvas.translate(w * 0.65, h * 0.45);
    canvas.rotate(math.pi / 6);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: w * 0.22, height: h * 0.32),
      eyePaint,
    );
    canvas.restore();

    // Nostril dots
    final dotPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.46, h * 0.72), 0.7, dotPaint);
    canvas.drawCircle(Offset(w * 0.54, h * 0.72), 0.7, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Skull / Mascot Badge
class SkullBadge extends StatelessWidget {
  final double size;

  const SkullBadge({super.key, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFF1E2652),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.65, size * 0.65),
          painter: _SkullPainter(),
        ),
      ),
    );
  }
}

class _SkullPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final skullPaint = Paint()
      ..color = const Color(0xFFD0D5EE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;

    final skullFill = Paint()
      ..color = const Color(0xFF1E2652)
      ..style = PaintingStyle.fill;

    // Skull head dome and jaw
    final skullPath = Path();
    skullPath.moveTo(w * 0.25, h * 0.65);
    skullPath.cubicTo(w * 0.05, h * 0.55, 0, h * 0.2, w * 0.5, 0);
    skullPath.cubicTo(w * 1.0, h * 0.2, w * 0.95, h * 0.55, w * 0.75, h * 0.65);
    skullPath.lineTo(w * 0.75, h * 0.9);
    skullPath.lineTo(w * 0.25, h * 0.9);
    skullPath.close();

    canvas.drawPath(skullPath, skullFill);
    canvas.drawPath(skullPath, skullPaint);

    // Eye sockets
    final eyePaint = Paint()
      ..color = const Color(0xFFD0D5EE)
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.35, h * 0.42), width: w * 0.2, height: h * 0.25),
      eyePaint,
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.65, h * 0.42), width: w * 0.2, height: h * 0.25),
      eyePaint,
    );

    // Teeth lines
    final teethPaint = Paint()
      ..color = const Color(0xFFD0D5EE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1;

    canvas.drawLine(Offset(w * 0.42, h * 0.75), Offset(w * 0.42, h * 0.9), teethPaint);
    canvas.drawLine(Offset(w * 0.58, h * 0.75), Offset(w * 0.58, h * 0.9), teethPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Double Chevron Up Icon (Red / Priority Indicator)
class DoubleChevronUp extends StatelessWidget {
  final Color color;
  final double size;

  const DoubleChevronUp({
    super.key,
    this.color = const Color(0xFFE57373),
    this.size = 14,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _DoubleChevronPainter(color: color),
      ),
    );
  }
}

class _DoubleChevronPainter extends CustomPainter {
  final Color color;

  _DoubleChevronPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Top chevron
    final pathTop = Path();
    pathTop.moveTo(0, h * 0.38);
    pathTop.lineTo(w * 0.5, 0.05 * h);
    pathTop.lineTo(w, h * 0.38);
    canvas.drawPath(pathTop, paint);

    // Bottom chevron
    final pathBottom = Path();
    pathBottom.moveTo(0, h * 0.85);
    pathBottom.lineTo(w * 0.5, 0.52 * h);
    pathBottom.lineTo(w, h * 0.85);
    canvas.drawPath(pathBottom, paint);
  }

  @override
  bool shouldRepaint(covariant _DoubleChevronPainter oldDelegate) =>
      oldDelegate.color != color;
}
