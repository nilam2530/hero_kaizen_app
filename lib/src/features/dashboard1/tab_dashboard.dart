import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import 'package:hero_kaizen_app/src/features/dashboard1/DashboardTwo.dart';
import 'package:hero_kaizen_app/src/features/dashboard1/dashboard1.dart';
import 'package:provider/provider.dart';
import '../../app_configs/app_colors.dart';
import '../create_new_request/create_new_request_screen.dart';
import '../kaizen_sheet/kainez_sheet.dart';
import '../landing_dashboard/landing_dashboard_view.dart';
import '../sidebar/custom_appbar/landing_app_bar.dart';
import '../sidebar/custom_appbar/menu_button_widget.dart';
import '../view_request_status/view_request_status.dart';

class TabDashboard extends StatefulWidget {
  const TabDashboard({super.key});

  @override
  TabDashboardState createState() => TabDashboardState();
}

class TabDashboardState extends State<TabDashboard> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabControllerProviderDashboard(
        vsync: this,
        length: 6,
      ),
      child: const DashboardTabs(),
    );
  }

  @override
  void dispose() {
    // Use context.read instead of Provider.of with listen: false
    context.read<TabControllerProviderDashboard>().dispose();
    super.dispose();
  }
}

class DashboardTabs extends StatelessWidget {
  const DashboardTabs({super.key});

  // Tabs with icons and text
  final List<Map<String, dynamic>> _tabs = const [
    {'title': 'Dashboard', 'image': AppImages.imageDashboardTab},
    {'title': 'All Requests', 'image': AppImages.allRequest},
    {'title': 'My Requests', 'image': AppImages.myRequest},
    {'title': 'Approved Requests', 'image': AppImages.pending},
    {'title': 'Create Request', 'image': AppImages.createRequestIcon},
    {'title': 'Reports', 'image': AppImages.filter1},

  ];

  @override
  Widget build(BuildContext context) {
    final tabControllerProvider = context.watch<TabControllerProviderDashboard>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: size.width < 600
          ? AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints:
                const BoxConstraints(maxWidth: 120, maxHeight: 60),
                child: SvgPicture.asset(
                  AppImages.heroAppBar,
                  width: size.width < 600
                      ? size.width * .15
                      : size.width * .15,
                  height: size.width < 600
                      ? size.width * .05
                      : size.width * .065,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                "Kaizen System",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.lightBlack,
                ),
              ),

            ],
          ),
        ),
        actions: const [CustomMenuIconButtonScreen()],
      )
          : const LandingCustomAppBar(),
      body: Column(
        children: [
          // Responsive TabBar with icons and text
          Container(
            color: AppColors.whiteColor,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TabBar(
              dividerColor: AppColors.whiteColor,
              controller: tabControllerProvider.tabController,
              isScrollable: true,
              tabs: _tabs.map((tab) => Tab(
                child: Row(
                  children: [
                    SvgPicture.asset(tab['image'], width: 24, height: 24),
                    const SizedBox(width: 8), // Added spacing between icon and text
                    Text(tab['title']),
                  ],
                ),
              )).toList(),
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 600 ? 18 : 16,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 600 ? 18 : 16,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.red, width: 4.0),
              ),
            ),
          ),
          // TabBarView for switching content
          Expanded(
            child: TabBarView(
              controller: tabControllerProvider.tabController,
              children: const [
                LandingDashboardView(),
                DashboardTwo(),
                Dashboard1(),
                ViewRequestScreen(),
                CreateNewRequestDesktopScreen(),
                KaizenSheetScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TabControllerProviderDashboard class to manage tab controller
class TabControllerProviderDashboard extends ChangeNotifier {
  late TabController tabController;

  TabControllerProviderDashboard({required TickerProvider vsync, required int length}) {
    tabController = TabController(length: length, vsync: vsync);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
