import 'package:flutter/material.dart';

class MyCustomButton1 extends StatefulWidget {
  final String name;
  final Color btnColor;
  final Color textColor;
  final Widget? mWidget;
  final VoidCallback onTap;
  final Image? icon;

  const MyCustomButton1({
    super.key,
    required this.name,
    required this.textColor,
    required this.btnColor,
    required this.onTap,
    this.mWidget,
    this.icon,
  });

  @override
  State<MyCustomButton1> createState() => _MyCustomButton1State();
}

class _MyCustomButton1State extends State<MyCustomButton1> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomPaint(
      painter: MyPainter(widget.btnColor),
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          // width: widget.icon != null?150:100,
          //height: screenHeight * 0.05,
          child: Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: screenWidth<600?screenWidth * 0.05:screenWidth * 0.025,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  widget.icon!,
                  const SizedBox(width: 8),
                ],
                widget.mWidget ??
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
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

  MyPainter(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class MyPainterBothEdges extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  MyPainterBothEdges(this.backgroundColor, {this.borderColor = Colors.transparent, this.borderWidth = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(10, 0)
      ..lineTo(size.width - 10, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 10)
      ..lineTo(size.width, size.height)
      ..lineTo(10, size.height)
      ..arcToPoint(
        Offset(0, size.height - 10),
        //radius: Radius.circular(10),
        clockwise: false,
      )
      ..lineTo(0, 10)
      ..arcToPoint(
        Offset(10, 0),
        //radius: const Radius.circular(10),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(path, paint);

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