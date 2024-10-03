import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_kaizen_app/src/app_configs/app_colors.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import 'package:hero_kaizen_app/src/app_configs/custom_style.dart';
import 'package:hero_kaizen_app/src/common_widgets/custom_drop_down/custom_drop_down.dart';
import 'package:hero_kaizen_app/src/common_widgets/custom_fields/text/custom_text_field.dart';
import 'package:hero_kaizen_app/src/common_widgets/mobile_preview_not_available.dart';
import 'package:hero_kaizen_app/src/features/landing_dashboard/provider/landing_dashborad_controller.dart';
import 'package:hero_kaizen_app/src/features/landing_dashboard/dashboard_category_cards_view.dart';
import 'package:hero_kaizen_app/src/features/sidebar/admin_right_side_animated_menus.dart';
import 'package:provider/provider.dart';

class LandingDashboardView extends StatefulWidget {
  const LandingDashboardView({super.key});

  @override
  State<LandingDashboardView> createState() => _LandingDashboardViewState();
}

class _LandingDashboardViewState extends State<LandingDashboardView>  with TickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0;
  }
  Size? size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: Size(size!.width, size!.height));
    var controller = context.watch<LandingDashboardCOntroller>();
    return ChangeNotifierProvider<LandingDashboardCOntroller>(
        create: (ctx)=>LandingDashboardCOntroller(),
        builder: (context, snapshot) {
          return  Scaffold(
            body: Stack(
              children: [
                LayoutBuilder(builder: (context,constraints){
                  if(constraints.maxWidth>800) {
                    return ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                      child: ListView(
                        padding: const EdgeInsets.only(left: 16,top: 16,right: 40),
                        children: [
                          Text("Dashboard", style: CustomTextSty.style25Bold,),
                          getBikeSLider(controller),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              "My Applications", style: CustomTextSty.style25Bold,),
                          ),
                          Row(
                            children: [
                              TabBar(
                                controller: _tabController,
                                isScrollable: true,
                                //padding: EdgeInsets.all(1),
                                automaticIndicatorColorAdjustment: true,
                                onTap: (val) {
                                  controller.setTabIndexValue(val);
                                  _tabController.index = val;
                                },
                                tabs: const [
                                  Tab(child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("My Favourite Application"),
                                  ),),
                                  Tab(child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("All Application"),
                                  ),),
                                ],
                                tabAlignment: TabAlignment.start,
                                labelStyle: TextStyle(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .width > 600 ? 18 : 16,
                                    color: AppColors.whiteColor
                                ),
                                dividerColor: Colors.transparent,
                                unselectedLabelStyle: TextStyle(
                                  fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .width > 600 ? 18 : 16,
                                ),
                                indicator: const BoxDecoration(
                                  color: AppColors.btnRedColor,
                                  // Selected tab background color
                                  borderRadius: BorderRadius.all(Radius.circular(8)
                                  ),
                                ),
                                unselectedLabelColor: AppColors.darkGrey,
                                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              Expanded(child: getSearchTextFields(controller)),
                            ],
                          ),

                          const SizedBox(height: 8,),
                          Builder(builder: (_) {
                            if (controller.selectedTabIndex == 0) {
                              return DashboardCategoryCardsView(controller:controller,allCardsShow: false,);
                            } else if (controller.selectedTabIndex == 1) {
                              return DashboardCategoryCardsView(controller:controller,allCardsShow:true);
                            }
                            return Container();
                          }),
                        ],
                      ),
                    );
                  }
                  return const MobilePreviewNotAvailableVIew();

                }),
                Positioned(
                    right: 1,
                    top: 100,
                    child: AdminRightSideAnimatedMenus(
                      text: "Help & Support",
                      iconPath: AppImages.helpAndSupportRightIcon,
                      isClicked: controller.selectedMenuOption =="one",
                      callbackFunction: ()
                      {
                        if(controller.menuStringValue=="one"){
                          controller.clickedOnHelpContainer("");
                        } else {
                          controller.clickedOnHelpContainer("one");
                        }},itemkey: "one",
                      //key: UniqueKey(),

                    )),
                Positioned(
                  right: 1,
                  top: 160,
                  child: AdminRightSideAnimatedMenus(
                    text: "Support",
                    iconPath: AppImages.secondIconRightSide,
                    isClicked: controller.selectedMenuOption =="two",
                    callbackFunction: (){
                      if(controller.menuStringValue=="two"){
                        controller.clickedOnHelpContainer("");
                      } else {
                        controller.clickedOnHelpContainer("two");
                      }
                    },itemkey: "two",

                  ),
                ),
                Positioned(
                  right: 1,
                  top: 220,
                  child: AdminRightSideAnimatedMenus(
                    text: "Third",
                    iconPath: AppImages.secondIconRightSide,
                    isClicked: controller.selectedMenuOption =="Third",
                    callbackFunction: (){
                      if(controller.menuStringValue=="Third"){
                        controller.clickedOnHelpContainer("");
                      } else {
                        controller.clickedOnHelpContainer("Third");
                      }
                    },itemkey: "Third",

                  ),
                ),

              ],
            ),
          );
        }
    );
  }
  String?categoryName;
  getSearchTextFields(LandingDashboardCOntroller controller)=>Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [

      SizedBox(
        width: size!.width*.15,
        child: CustomDropdown(label: "", value: controller.selectedCategory, items: const ["Cat 1","Cat 2"],
            hintText: "Select Category",
            onChanged: (val){
              controller.changeCategoryName(val!);
            }),
      ),
      const SizedBox(width: 16,),
      SizedBox(
        width: size!.width*.15,
        child: CustomTextField(labelText: "Search", onSaved: (val){},
          prefix: const Icon(Icons.search),maxLines: 1,),
      ),
    ],
  );


  getBikeSLider(LandingDashboardCOntroller controller)=>
      SizedBox(
        height:MediaQuery.of(context)
            .size
            .height*.4,
        child: CarouselSlider(
          items: controller.sliderIMage.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  imageUrl,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context)
                      .size
                      .width,
                  height: MediaQuery.of(context)
                      .size
                      .height*.4,// Ensure image takes full width
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            // Ensures only one image is shown at a time
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
            },
          ),
        ),
      );
}
