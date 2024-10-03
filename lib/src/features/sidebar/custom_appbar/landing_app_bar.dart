import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_kaizen_app/src/features/landing_dashboard/CustomMenuIconButtonScreen1.dart';
import 'package:hero_kaizen_app/src/features/sidebar/custom_appbar/menu_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:hero_kaizen_app/src/app_configs/app_colors.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import 'package:hero_kaizen_app/src/themes/theme_provider.dart';

import '../../../constants/AppStringConstants.dart';

class LandingCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const LandingCustomAppBar({super.key});

  @override
  LandingCustomAppBarState createState() => LandingCustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LandingCustomAppBarState extends State<LandingCustomAppBar> {
  final TextEditingController _searchController = TextEditingController();
  List<String> filteredTitles = [];
  List<String> titles = [
    'Inbound Logistics',
    'Employee Compliance Application',
    'HIRA system',
    'Injury Identification System',
    'Tag Redress System',
    'Kaizen System',
    'One Point Lesson',
    'Quality Alert System',
    'SOP System (SS & SC Function)',
    'SOP System (Project Engineering Department)',
  ];

  List<String>imagesList = [
    // AppImages.notification,
    AppImages.appBarProfile,
    AppImages.downArrow,
  ];
  @override
  void initState() {
    super.initState();
    filteredTitles = titles; // Initialize with all items
    _searchController.addListener(_filterSearchResults);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSearchResults() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredTitles = titles
          .where((title) => title.toLowerCase().contains(query))
          .toList();
    });
  }

  ThemeProvider?themeProvider;
  Size? screenSIze;
  @override
  Widget build(BuildContext context) {
    screenSIze  = MediaQuery.of(context).size;
    themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white),
          bottom: BorderSide(color: AppColors.lightGrey, width: 1),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.darBlack,
        leading: const CustomMenuIconButtonScreen1(),
        title: _buildTitleRow(),
        actions: [
          Image.asset(AppImages.appBarProfile,),
          PopupMenuButton<int>(
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            color: AppColors.whiteColor,
            onSelected: null,
            itemBuilder: (context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem(
                  value: 0,
                  padding: EdgeInsets.zero,
                    child: Container(
                        color: AppColors.whiteColor,
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AppImages.appBarProfile,),
                                      const Expanded(child:  Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             Text("Mohit Sharma"),
                                             Text("Sr. Engineer"),
                                             Text("mohit@heromotorcorp.com"),
                                          ],
                                        ),
                                      ))

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.logoutIcon,height: 24,),
                                      const Text("Logout")
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                ),
              ];
            },
          ),
          //IconButton(onPressed: ()=>showLogout(), icon: const Icon(Icons.keyboard_arrow_down_rounded))
        ],
      ),
    );
  }

  showLogout(){
    showDialog(context: context,builder: (cntxt){
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,alignment: Alignment.topRight,
        content: Wrap(
          children: [
            Row(
              children: [
                Image.asset(AppImages.appBarProfile,),
                const Expanded(child: Column(
                  children: [
                    Text("Mohit Sharma"),
                    Text("Sr. Engineer"),
                    Text("mohit@heromotorcorp.com"),
                  ],
                ))

              ],
            )
          ],
        ),
      );
    });
  }

  Widget _buildTitleRow() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: (){
              GoRouter.of(context).go('/mainScreen');
            },
            child: Container(
              constraints: const BoxConstraints(maxWidth: 120,maxHeight: 60),
              child: SvgPicture.asset(
                AppImages.heroAppbarImg,
                width: screenSIze!.width<600?screenSIze!.width*.15:screenSIze!.width*.15,
                height:  screenSIze!.width<600?screenSIze!.width*.05:screenSIze!.width*.065,
                fit: BoxFit.contain,
              ),
            ),
          ),
         SizedBox(width: 10,),
        Container(
          width: 1,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.lightGrey
          ),
        ),
        SizedBox(width: 10,),
        Text("Kaizen System",style: TextStyle(fontSize: 14.sp,color: AppColors.whiteColor),),
        screenSIze!.width<800?
        Expanded(child: Center(child: _buildSearchBox(),)):Expanded(child: Center(child: _buildSearchBox(),)),
      ],
    );
  }

  Widget _buildSearchBox() {
    return SizedBox(
      width: screenSIze!.width*.4, // Set fixed width for the search bar
      height: 38, // Set fixed height
      child: Container(
        constraints: const BoxConstraints(maxWidth: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.searchBgColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.dark3Grey, width: 1),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, size: 20,color: Colors.white,),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppStringConstants.searchTextLandingScreen,
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: AppColors.lightGrey,
                    )
                  ),
                  style: const TextStyle(fontSize: 14,color: AppColors.whiteColor), // Adjust font size if needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
