import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_kaizen_app/src/features/view_request_status/widget/view_request_action_widget.dart';
import 'package:hero_kaizen_app/src/features/view_request_status/widget/view_request_input_widget.dart';
import '../../app_configs/app_colors.dart';
import '../../app_configs/app_images.dart';
import '../../app_configs/custom_style.dart';

class ViewRequestScreen extends StatelessWidget {
  const ViewRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppImages.identification),
                  ),
                  Text('Hazard Correction Details',
                      style: CustomTextSty.mTextStyle13),
                ],
              ),
              const Column(
                children: [
                  ViewRequestWidget(),
                  SizedBox(height: 20),
                  ViewRequestActionWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
