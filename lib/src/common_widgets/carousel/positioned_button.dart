import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_configs/app_colors.dart';
import '../custom_btn/custom_elevated_btn.dart';
import 'carouselprovider.dart';

class PositionedTextAndButton extends StatelessWidget {
  final List<String> texts;
  final List<VoidCallback> buttonCallbacks;

  const PositionedTextAndButton({
    super.key,
    required this.texts,
    required this.buttonCallbacks,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<CarouselProvider>().currentIndex;

    return Positioned(
      bottom: 35,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texts[currentIndex],
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 160,
            height: 35,
            child: MyCustomButton(
              name: 'View More',
              textColor: AppColors.whiteColor,
              btnColor: AppColors.darBlack,
              borderColor: AppColors.whiteColor,
              borderWidth: 1,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
