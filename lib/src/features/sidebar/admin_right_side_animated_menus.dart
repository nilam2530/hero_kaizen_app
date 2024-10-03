import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_kaizen_app/src/app_configs/app_colors.dart';
import 'package:hero_kaizen_app/src/app_configs/custom_style.dart';

import '../../common_widgets/custom_btn/custom_eleveted1.dart';

class AdminRightSideAnimatedMenus extends StatelessWidget {
  final VoidCallback callbackFunction;
  final String iconPath;
  final String text;
  final String itemkey;
  final bool isClicked;
  AdminRightSideAnimatedMenus(
      {super.key,
        required this.callbackFunction,
        required this.iconPath,
        required this.text,
        required this.isClicked,required this.itemkey});
  //GlobalKey<ValueKey> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: callbackFunction,
      key: ValueKey(itemkey),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: isClicked ? 150 : 50,
        height: 50,
        child: CustomPaint(
          painter: MyPainterBothEdges(AppColors.btnRedColor),
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.btnRedColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    topLeft: Radius.circular(24))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: isClicked ? 6.0 : 1),
                    child: SvgPicture.asset(iconPath),
                  ),
                  if (isClicked)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          text,
                          style: CustomTextSty.style14Normal
                              .copyWith(color: AppColors.whiteColor,overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    )
                  else
                    Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
