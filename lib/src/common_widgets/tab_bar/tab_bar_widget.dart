import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../app_configs/app_colors.dart';
import '../../app_configs/app_images.dart';
import 'tabbar_provider.dart';

class MyTabBarWidget extends StatelessWidget {
  final TabController tabController;
  final Function(int)? onTabChange;

  const MyTabBarWidget({super.key, required this.tabController, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, tabProvider, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: TabBar(

            controller: tabController,
            isScrollable: true,
            onTap: (val) {
              tabProvider.selectTab(val);
              if (onTabChange != null) {
                onTabChange!(val);
              }
            },
            tabs: _buildTabs(tabProvider),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildTabs(TabProvider tabProvider) {
    return [
      _buildTab(0, "Dashboard", AppImages.imageDashboardTab, tabProvider.selectedIndex),
      _buildTab(1, "All Requests", AppImages.allRequest, tabProvider.selectedIndex),
      _buildTab(2, "My Request", AppImages.myRequest, tabProvider.selectedIndex),
      _buildTab(3, "Pending for Approval", AppImages.pending, tabProvider.selectedIndex),
      _buildTab(4, "Create Request", AppImages.createRequestIcon, tabProvider.selectedIndex),
    ];
  }

  Tab _buildTab(int index, String text, String iconPath, int selectedIndex) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 16,
              width: 16,
              color: selectedIndex == index ? AppColors.btnRedColor : AppColors.buttonTextColor,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: selectedIndex == index ? AppColors.btnRedColor : AppColors.buttonTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
