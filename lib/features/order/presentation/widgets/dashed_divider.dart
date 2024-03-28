import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double thickness;
  final double dashWidth;
  final double dashSpace;

  const DashedDivider({
    super.key,
    this.height = 50,
    this.color = Colors.black,
    this.thickness = 2,
    this.dashWidth = 12,
    this.dashSpace = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: DashedLinePainter(color, thickness, dashWidth, dashSpace),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dashWidth;
  final double dashSpace;

  DashedLinePainter(this.color, this.thickness, this.dashWidth, this.dashSpace);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = thickness;

    final double halfDashWidth = dashWidth / 2;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + halfDashWidth),
        paint,
      );
      startY += dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
