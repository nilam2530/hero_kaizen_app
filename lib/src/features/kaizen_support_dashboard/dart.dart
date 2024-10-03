// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hero_kaizen_app/src/app_configs/app_colors.dart';
// import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
// import 'package:hero_kaizen_app/src/app_configs/custom_style.dart';
// import 'package:hero_kaizen_app/src/common_widgets/custom_drop_down/custom_drop_down.dart';
// import 'package:hero_kaizen_app/src/common_widgets/custom_fields/text/custom_text_field.dart';
// import 'package:hero_kaizen_app/src/common_widgets/mobile_preview_not_available.dart';
// import 'package:hero_kaizen_app/src/features/dashboard/dashboard.dart';
// import 'package:hero_kaizen_app/src/features/landing_dashboard/provider/landing_dashborad_controller.dart';
// import 'package:provider/provider.dart';
//
// class LandingDashboardView extends StatefulWidget {
//   const LandingDashboardView({super.key});
//
//   @override
//   State<LandingDashboardView> createState() => _LandingDashboardViewState();
// }
//
// class _LandingDashboardViewState extends State<LandingDashboardView>  with SingleTickerProviderStateMixin{
//   late TabController _tabController;
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _tabController.index = 0;
//   }
//   Size? size;
//   @override
//   Widget build(BuildContext context) {
//     var controller = context.watch<LandingDashboardCOntroller>();
//     size = MediaQuery.of(context).size;
//     return ChangeNotifierProvider<LandingDashboardCOntroller>(
//         create: (ctx)=>LandingDashboardCOntroller(),
//         builder: (context, snapshot) {
//           return  Scaffold(
//             body: LayoutBuilder(builder: (context,constraints){
//               if(constraints.maxWidth>800) {
//                 return ListView(
//                   padding: EdgeInsets.all(16),
//                   children: [
//                     Text("Dashboard", style: CustomTextSty.style25Bold,),
//                     getBikeSLider(controller),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16.0),
//                       child: Text(
//                         "My Applications", style: CustomTextSty.style25Bold,),
//                     ),
//                     Row(
//                       children: [
//                         TabBar(
//                           controller: _tabController,
//                           isScrollable: true,
//                           //padding: EdgeInsets.all(1),
//                           automaticIndicatorColorAdjustment: true,
//                           onTap: (val) {
//                             controller.setTabIndexValue(val);
//                             _tabController.index = val;
//                           },
//                           tabs: const [
//                             Tab(child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text("My Favourite Application"),
//                             ),),
//                             Tab(child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text("All Application"),
//                             ),),
//                           ],
//                           tabAlignment: TabAlignment.start,
//                           labelStyle: TextStyle(
//                               fontSize: MediaQuery
//                                   .of(context)
//                                   .size
//                                   .width > 600 ? 18 : 16,
//                               color: AppColors.whiteColor
//                           ),
//                           dividerColor: Colors.transparent,
//                           unselectedLabelStyle: TextStyle(
//                             fontSize: MediaQuery
//                                 .of(context)
//                                 .size
//                                 .width > 600 ? 18 : 16,
//                           ),
//                           indicator: const BoxDecoration(
//                             color: AppColors.btnRedColor,
//                             // Selected tab background color
//                             borderRadius: BorderRadius.all(Radius.circular(8)
//                             ),
//                           ),
//                           labelPadding: const EdgeInsets.symmetric(horizontal: 8),
//                         ),
//                         Expanded(child: getSearchTextFields(controller)),
//                       ],
//                     ),
//
//                     SizedBox(height: 8,),
//                     Builder(builder: (_) {
//                       if (controller.selectedTabIndex == 0) {
//                         return getCardsContainer(controller,);
//                       } else if (controller.selectedTabIndex == 1) {
//                         return getCardsContainer(controller,all: true);
//
//                       }
//                       return Text("sorry");
//                     }),
//                   ],
//                 );
//               }
//               return const MobilePreviewNotAvailableVIew();
//
//             }),
//           );
//         }
//     );
//   }
//   String?categoryName;
//   getSearchTextFields(LandingDashboardCOntroller controller)=>Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//
//       SizedBox(
//         width: size!.width*.15,
//         child: CustomDropdown(label: "", value: controller.selectedCategory, items: ["Cat 1","Cat 2"],
//             hintText: "Select Category",
//             onChanged: (val){
//               controller.changeCategoryName(val!);
//             }),
//       ),
//       SizedBox(width: 16,),
//       SizedBox(
//         width: size!.width*.15,
//         child: CustomTextField(labelText: "Search", onSaved: (val){},
//           prefix: Icon(Icons.search),maxLines: 1,),
//       ),
//     ],
//   );
//
//   getCardsContainer(LandingDashboardCOntroller controller,{bool?all = false})=>GridView.builder(
//     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: size!.width<900?2:3,
//         childAspectRatio: 3/1.5,mainAxisSpacing: 1,crossAxisSpacing: 1),
//     itemCount: all!?controller.landingCardsList.length:4,//controller.landingCardsList.length,
//     shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
//     itemBuilder: (context,index)=>
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               ConstrainedBox(
//                 constraints: BoxConstraints(
//                     maxHeight: size!.width>800?size!.height*.175:size!.height*.15),
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                           color: AppColors.darBlack
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: SvgPicture.asset(controller.landingCardsList[index].cardMainImage!),
//                             ),
//                             Expanded(child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(controller.landingCardsList[index].categoryName!,style: CustomTextSty.style12NTextColor,),
//                                   Text(controller.landingCardsList[index].titleName!,
//                                     style: CustomTextSty.style16Bold,maxLines: 1,overflow: TextOverflow.ellipsis,),
//                                   Text(controller.landingCardsList[index].descriptionText!,overflow: TextOverflow.ellipsis,maxLines: 2,),
//                                 ],
//                               ),
//                             ))
//                           ],
//                         ),
//                       ),
//                     ),
//                     SvgPicture.asset(AppImages.container_mask_img)
//                   ],
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.containerColorLightGrey,
//                     border: Border.all(color: AppColors.containerBorderColorLightGrey)
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
//                 child: Row(
//                   children:[
//                     for(var  data in controller.landingCardsList[index].actionsList!)
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                         child: Column(
//                           children: [
//                             SvgPicture.asset(data.actionImagePath!,height: 18,),
//                             Text(data.actionName!,style: CustomTextSty.style10NTextColor,overflow: TextOverflow.ellipsis,maxLines: 1,),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//   );
//
//
//   getBikeSLider(LandingDashboardCOntroller controller)=>
//       SizedBox(
//         height:MediaQuery.of(context)
//             .size
//             .height*.4,
//         child: CarouselSlider(
//           items: controller.sliderIMage.map((imageUrl) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Image.asset(
//                   imageUrl,
//                   fit: BoxFit.fill,
//                   width: MediaQuery.of(context)
//                       .size
//                       .width,
//                   height: MediaQuery.of(context)
//                       .size
//                       .height*.4,// Ensure image takes full width
//                 );
//               },
//             );
//           }).toList(),
//           options: CarouselOptions(
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 1.0,
//             // Ensures only one image is shown at a time
//             aspectRatio: 16 / 9,
//             onPageChanged: (index, reason) {
//             },
//           ),
//         ),
//       );
// }
