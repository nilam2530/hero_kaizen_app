import 'package:flutter/material.dart';

import 'app_colors.dart';

TextStyle textStyle() {
  return const TextStyle(
    fontFamily: 'Gotham-Bold',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 18 / 14,
    color: AppColors.lightBlack,
  );
}

TextStyle textStyleFont14W400Black() {
  return const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.darBlack);
}

TextStyle textStyleFont14W400White() {
  return const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.whiteColor);
}

TextStyle textStyleFont18W600Black() {
  return const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.darBlack);
}
