import 'package:flutter/material.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import '../../app_configs/custom_style.dart';
import '../../common_widgets/paint_custom/custom_normal_container.dart';
import '../../themes/custom_text_style.dart';

class HazardCorrectionDetail extends StatefulWidget {
  const HazardCorrectionDetail({super.key});

  @override
  State<HazardCorrectionDetail> createState() => _HazardCorrectionDetailState();
}

class _HazardCorrectionDetailState extends State<HazardCorrectionDetail> {
  Size? screen_size;

  @override
  Widget build(BuildContext context) {
    screen_size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Image and Heading
            Row(
              children: [
                Image.asset(AppImages.viewRequest),
                const SizedBox(width: 10.0),
                Text('Hazard Correction Details', style: CustomTextSty.mTextStyle13),
              ],
            ),

            // Container/Sized Box
            CustomNormalContainer(
              child: Column(
                children: [
                  // Call separate methods based on screen size
                  screen_size!.width < 600
                      ? _buildMobileLayout()
                      : _buildDesktopLayout(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method for mobile layout
  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Row 1
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

        // Row 3
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Department Section', style: CustomTextSty.subHeadingStyle),
                  Text('Frame Assy', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Responsible Person', style: CustomTextSty.subHeadingStyle),
                  Text('Radhika Garg', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
          ],
        ),
        space1,

        // Row 4
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Initiator Name', style: CustomTextSty.subHeadingStyle),
                  Text('Radhika Garg', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hazard Impact', style: CustomTextSty.subHeadingStyle),
                  Text('Never Miss Incident', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
          ],
        ),
        space1,

        // Row 5
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Audit Type', style: CustomTextSty.subHeadingStyle),
                  Text('Traffic Safety Audit', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Status'), Image.asset('assets/images/pending.png'),
                  // Text('Pending', style: Styles.valueStyle),
                ],
              ),
            ),
          ],
        ),
        space1,

        // Row 6
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Risk Level', style: CustomTextSty.subHeadingStyle),
                  Row(
                    children: [
                      Image.asset('assets/images/Flag.png'),
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
                  Text('Impact Description', style: CustomTextSty.subHeadingStyle),
                  Text('Lorem ipsum harmful for the body', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Method for desktop layout
  Widget _buildDesktopLayout() {
    return Column(
      children: [
        // Row 1
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
                  Text('Department Section', style: CustomTextSty.subHeadingStyle),
                  Text('Frame Assy', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Responsible Person', style: CustomTextSty.subHeadingStyle),
                  Text('Radhika Garg', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Initiator Name', style: CustomTextSty.subHeadingStyle),
                  Text('Radhika Garg', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hazard Impact', style: CustomTextSty.subHeadingStyle),
                  Text('Never Miss Incident', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
          ],
        ),
        space1,

        // Row 3
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Audit Type', style: CustomTextSty.subHeadingStyle),
                  Text('Traffic Safety Audit', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Status'), Image.asset('assets/images/pending.png'),
                  // Text('Pending', style: Styles.valueStyle),
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
                      Image.asset('assets/images/Flag.png'),
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
                  Text('Impact Description', style: CustomTextSty.subHeadingStyle),
                  Text('Lorem ipsum harmful for the body', style: CustomTextSty.valueStyle),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}