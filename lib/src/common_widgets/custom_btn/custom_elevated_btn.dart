import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final String name;
  final Color? btnColor;
  final Color textColor;
  final Widget? mWidget;
  final VoidCallback onTap;
  final Widget? icon;
  final Color borderColor;
  final double borderWidth;

  const MyCustomButton({
    super.key,
    required this.name,
    required this.textColor,
    this.btnColor,
    required this.onTap,
    this.mWidget,
    this.icon,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return CustomPaint(
      painter: MyPainter(
        btnColor!,
        borderColor: borderColor,
        borderWidth: borderWidth,
      ),
      child: Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: 150,
            height: screenHeight * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 8),
                ],
                mWidget ??
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        fontFamily: "OpenSansBold",
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor; // Border color parameter
  final double borderWidth; // Border width parameter

  MyPainter(this.backgroundColor, {this.borderColor = Colors.transparent, this.borderWidth = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw background
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(10, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 10)
      ..lineTo(size.width - 10, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 10)
      ..close();

    canvas.drawPath(path, paint);

    // Draw border if width is greater than 0
    if (borderWidth > 0.0) {
      final borderPaint = Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth;

      canvas.drawPath(path, borderPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
