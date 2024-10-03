import 'package:flutter/material.dart';
import 'package:hero_kaizen_app/src/common_widgets/custom_btn/custom_elevated_btn.dart';

class CustomShapeWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;

  const CustomShapeWidget({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: MyPainter(backgroundColor),
    );
  }
}
