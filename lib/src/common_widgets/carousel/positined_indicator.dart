import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_configs/app_colors.dart';
import 'carouselprovider.dart';

class PositionedIndicator extends StatelessWidget {
  final int imageCount;

  const PositionedIndicator({super.key, required this.imageCount});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<CarouselProvider>().currentIndex;
    return Positioned(
      bottom: 12,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          imageCount,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: currentIndex == index ? 36 : 34,
            height: 4,
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? AppColors.darkMaron
                  : AppColors.whiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
