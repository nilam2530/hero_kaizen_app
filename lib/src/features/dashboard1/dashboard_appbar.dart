import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hero_kaizen_app/src/features/sidebar/custom_appbar/menu_button_widget.dart';
import 'package:hero_kaizen_app/src/app_configs/app_colors.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import 'package:hero_kaizen_app/src/themes/theme_provider.dart';

class CustomAppBar1 extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar1({super.key});

  @override
  CustomAppBar1State createState() => CustomAppBar1State();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar1State extends State<CustomAppBar1> {
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

  List<String> imagesList = [
    AppImages.notification,
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
      filteredTitles =
          titles.where((title) => title.toLowerCase().contains(query)).toList();
    });
  }

  late ThemeProvider themeProvider;

  Size? screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white),
          bottom: BorderSide(color: AppColors.lightGrey, width: 1),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColormain,
        leading: const CustomMenuIconButtonScreen(),
        title: _buildTitleRow(),
        actions: [
          ..._buildActionIcons(),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 120, maxHeight: 60),
          child: Image.asset(
            AppImages.heroAppBar,
            width: screenSize!.width < 600
                ? screenSize!.width * .15
                : screenSize!.width * .15,
            height: screenSize!.width < 600
                ? screenSize!.width * .05
                : screenSize!.width * .065,
            fit: BoxFit.contain,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Kaizen System",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.lightBlack,
            ),
          ),
        ),

      ],
    );
  }


  List<Widget> _buildActionIcons() {
    return imagesList
        .map((imagePath) => IconButton(
      icon: Image.network(imagePath, width: 20, height: 20),
      onPressed: () {
        if (imagePath.toLowerCase().contains("profile")) {
          showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(1, 50, 0, 0),
            items: [
              const PopupMenuItem(
                value: 1,
                child: Text("Dark Theme"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("Light Theme"),
              ),
            ],
            elevation: 8.0,
          ).then((value) {
            themeProvider.toggleTheme(value!.isOdd);
          });
        }
      },
    ))
        .toList();
  }
}
