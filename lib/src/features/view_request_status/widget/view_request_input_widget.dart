import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_configs/app_colors.dart';
import '../../../app_configs/app_images.dart';
import '../../../app_configs/custom_style.dart';
import '../../../common_widgets/paint_custom/custom_normal_container.dart';

class ViewRequestWidget extends StatelessWidget {
  const ViewRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Project Name', style: CustomTextSty.subHeadingStyle),
                    Text('Gurgaon Plant', style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category', style: CustomTextSty.subHeadingStyle),
                    Text('Actual', style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Department', style: CustomTextSty.subHeadingStyle),
                    Text('Frame Plant', style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sub Category', style: CustomTextSty.subHeadingStyle),
                    Text('Fire', style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
            ],
          ),
          space1,
          // Row 2
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Department Section',
                        style: CustomTextSty.subHeadingStyle),
                    Text('Frame Assy', style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Responsible Person',
                        style: CustomTextSty.subHeadingStyle),
                    Text('Radhika Garg', style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Initiator Name',
                        style: CustomTextSty.subHeadingStyle),
                    Text('Radhika Garg', style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hazard Impact', style: CustomTextSty.subHeadingStyle),
                    Text('Never Miss Incident',
                        style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
            ],
          ),
          space1,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Audit Type', style: CustomTextSty.subHeadingStyle),
                    Text('Traffic Safety Audit',
                        style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Status'),
                    Container(
                        decoration:
                        const BoxDecoration(color: AppColors.bgPenDing),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Pending',
                            style: TextStyle(color: Color(0xFFDA700E)),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Risk Level', style: CustomTextSty.subHeadingStyle),
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.flag),
                        Text('High', style: CustomTextSty.valueStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Impact Description',
                        style: CustomTextSty.subHeadingStyle),
                    Text('Lorem ipsum harmful for the body',
                        style: CustomTextSty.valueStyle),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
