import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_kaizen_app/src/features/sidebar/custom_appbar/menu_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:hero_kaizen_app/src/app_configs/app_colors.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import 'package:hero_kaizen_app/src/common_widgets/custom_drawer/custom_drawer.dart';
import 'package:hero_kaizen_app/src/features/sidebar/controller/sidemenu_controller.dart';
import 'package:hero_kaizen_app/src/features/sidebar/custom_appbar/custom_appBar.dart';

class ShellLayout extends StatelessWidget {
  final Widget child;

   ShellLayout({super.key, required this.child});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late Size size;
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
    final dashBoardProvider = context.watch<SidemeuController>();
    final drawerWidth = dashBoardProvider.isDrawerOpen ?
     200.0 : 56.0;
    if (kDebugMode) {
      print("drawerWidth$drawerWidth");
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: size.width<600?AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 120,maxHeight: 60),
                child: Image.asset(
                  AppImages.heroAppBar,
                  width: size.width<600?size.width*.15:size.width*.15,
                  height:  size.width<600?size.width*.05:size.width*.065,
                  fit: BoxFit.contain,
                ),
              ),
               Text(
                "Welcome to Inbound Logistics",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.lightBlack,
                ),
              ),
            ],
          ),
        ),
        actions: const [
          CustomMenuIconButtonScreen()
        ],

      ):CustomAppBar(),
      backgroundColor: AppColors.backgroundColormain,
      drawer: Drawer(child: getSideContainer(drawerWidth,dashBoardProvider,context,fromDrawer: true),
        width: size.width*.45,),
      body: Stack(
        children: [
          Row(
            children: [
              // Side menu with animated open/close feature
              size.width<600?Container():
              getSideContainer(drawerWidth,dashBoardProvider,context,fromDrawer: null),
              // Expanded content to avoid overflow
              Expanded(
               // width: availableWidth,
                child: child,
              ),
            ],
          ),
          // Drawer toggle button
          size.width<600?Container():Positioned(
            top: 16,
            left: drawerWidth,
            child: GestureDetector(
              onTap: dashBoardProvider.toggleDrawer,
              child: Container(
                width: 12,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.btnRedColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Icon(
                  dashBoardProvider.isDrawerOpen
                      ? Icons.arrow_back_ios
                      : Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getSideContainer(double drawerWidth, SidemeuController dashBoardProvider,BuildContext context,{bool?fromDrawer})=>
      AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: drawerWidth,
        child: SideMenuWidget(
          isFromMobile: fromDrawer!=null?true:false,
          menuItems: dashBoardProvider.menuItems,
          onItemSelected: (index) {
            dashBoardProvider.handleMenuItemSelected(index, context);
          },
          isDrawerOpen: fromDrawer!=null?true:dashBoardProvider.isDrawerOpen,
          toggleDrawer: dashBoardProvider.toggleDrawer,
        ),
      );
}
