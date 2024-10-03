import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../app_configs/app_images.dart';
import '../../app_configs/custom_style.dart';
import '../../common_widgets/tab_bar/tabbar_provider.dart';
import '../kaizen_support_dashboard/kaizen_support_dashboard_view.dart';
import 'package:provider/provider.dart';

class DashboardTwo extends StatefulWidget {
  const DashboardTwo({super.key});

  @override
  State<DashboardTwo> createState() => _DashboardTwoState();
}

class _DashboardTwoState extends State<DashboardTwo> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppImages.identification),
                ),
                Text('Kaizen Support Dashboard',
                    style: CustomTextSty.mTextStyle13),
              ],
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go('/dashboardTwo/viewRequestStatus');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (MediaQuery.of(context).size.width / 350).floor(),
                      childAspectRatio: 1.7,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: 30,
                    itemBuilder: (context, index) => const CustomCardWidget(
                      backgroundImagePath: AppImages.maskGroup,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
