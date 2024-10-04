import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app_configs/app_colors.dart';

class SummaryCard extends StatelessWidget {
  final String imagePath;
  final String value;
  final String label;
  final Color backgroundColor;
  final double imageSize;
  final TextStyle? valueTextStyle;
  final TextStyle? labelTextStyle;
  final Image? bgImg;
  final double opacity;

  const SummaryCard({
    super.key,
    required this.imagePath,
    required this.value,
    required this.label,
    this.backgroundColor = Colors.white,
    this.imageSize = 40.0,
    this.valueTextStyle,
    this.labelTextStyle,
    this.bgImg,
    this.opacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10),
      child: Opacity(
        opacity: opacity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: 200,
              height: size.height * .10,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5)
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value,
                                  style: _textStyle(
                                    constraints,
                                    valueTextStyle,
                                    isLabel: false,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  label,
                                  textAlign: TextAlign.center,
                                  style: _textStyle(
                                    constraints,
                                    labelTextStyle,
                                    isLabel: true,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),

                            SvgPicture.asset(
                              imagePath,
                              height: imageSize,
                              width: imageSize,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        // Label text
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  TextStyle _textStyle(BoxConstraints constraints, TextStyle? style,
      {required bool isLabel}) {
    final baseFontSize = isLabel
        ? (constraints.maxWidth > 600 ? 16.0 : 14.0)
        : (constraints.maxWidth > 600 ? 20.0 : 18.0);
    return (style ?? const TextStyle()).copyWith(
      fontSize: baseFontSize,
      fontWeight: isLabel ? FontWeight.w500 : FontWeight.bold,
      color: AppColors.darBlack,
    );
  }
}
