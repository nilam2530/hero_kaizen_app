import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import 'package:provider/provider.dart';

import '../../features/sidebar/controller/sidemenu_controller.dart';
import '../../themes/theme_provider.dart';

class SideMenuWidget extends StatelessWidget {
  final List<MenuItemData> menuItems;
  final Function(int) onItemSelected;
  final bool isDrawerOpen;
  final bool isFromMobile;
  final VoidCallback toggleDrawer;

  SideMenuWidget({
    super.key,
    required this.menuItems,
    required this.onItemSelected,
    required this.isDrawerOpen,
    required this.isFromMobile,
    required this.toggleDrawer,
  });

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(
        builder: (context, model, child) {
          return AnimatedContainer(
            width: isDrawerOpen ? 200 : 72,
            duration: const Duration(milliseconds: 200),
            height: 1089,
            decoration:  BoxDecoration(
              color: model.currentThemeMode== ThemeMode.dark?Colors.black:Colors.white,
              border: const Border(
                right: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            child: isFromMobile?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getAvtarContainer(context),
                  Divider(
                    height: 1,thickness: .5,
                    color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.25),
                  ),
                  Expanded(child: menuItemsList())
                ],
              ),
            )
                :menuItemsList(),
          );
        }
    );
  }
  getAvtarContainer(BuildContext context)=>Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Image.asset(AppImages.appBarProfile,
          height: size.width*.075,
          fit: BoxFit.cover,),
        Expanded(child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Test@hero.com",
                style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(
                height: 4,
              ),
              Text("Mo: 999999999",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12.sp,
                    color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5)
                ),),
            ],
          ),
        )),

      ],
    ),
  );
  menuItemsList()=>ListView.builder(
    itemCount: menuItems.length,
    itemBuilder: (context, index) {
      final menuItem = menuItems[index];
      return MenuEntry(
        icon: menuItem.icon,
        title: menuItem.title,
        isSelected: false,
        isDrawerOpen: isDrawerOpen,
        // Pass isDrawerOpen down
        onTap: () => onItemSelected(index),
      );
    },
  );
}

// Define MenuEntry Widget
class MenuEntry extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final bool isDrawerOpen;
  final VoidCallback onTap;

  const MenuEntry({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.isDrawerOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            if (isDrawerOpen)
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
