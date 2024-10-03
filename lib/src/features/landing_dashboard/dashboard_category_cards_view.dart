import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_kaizen_app/src/app_configs/app_colors.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import 'package:hero_kaizen_app/src/app_configs/custom_style.dart';
import 'package:hero_kaizen_app/src/features/landing_dashboard/provider/landing_dashborad_controller.dart';

class DashboardCategoryCardsView extends StatelessWidget {
  final LandingDashboardCOntroller controller;
  final bool ?allCardsShow;
  const DashboardCategoryCardsView({super.key,required this.controller,this.allCardsShow});

  //List<PopupMenuItemModel>? menuItemList=[];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16/8,
              crossAxisCount:  (MediaQuery.of(context).size.width / 390).floor(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 1),
          itemCount: allCardsShow!?controller.landingCardsList.length:4,//controller.landingCardsList.length,
          shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: size.width>800?size.height*.075:size.height*.1,
                        ),
                  child: Stack(
                          children: [
                            Container(
                              height: size.width>800?size.height*.075:size.height*.1,
                              width: size.width,
                              decoration: const BoxDecoration(
                                color: AppColors.darBlack,
                              ),
                              child: Row(
                                children: [
                                  Expanded(child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: SvgPicture.asset(controller.landingCardsList[index].cardMainImage!),
                                      ),
                                      Text(controller.landingCardsList[index].titleName!,
                                        style: CustomTextSty.style16Bold.copyWith(
                                            color: AppColors.whiteColor
                                        ),
                                        maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    ],
                                  )),
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                      cardColor: Colors.white,
                                    ),
                                    child: PopupMenuButton<int>(
                                      icon: SvgPicture.asset(AppImages.dotsMenuIcon),
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      itemBuilder: (context) => [
                                        for(var data in controller.popMenuItemList!)
                                          PopupMenuItem(
                                            height: size.width>800?size.height*.05:size.height*.07,
                                          child: Wrap(
                                            children: [
                                              SvgPicture.asset(data.iconPath),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Text(data.itemName),
                                              )
                                            ],
                                          ))
                                     ] ,onSelected: (val){},
                                      offset: const Offset(0, 20),
                                      color: Colors.white,
                                      elevation: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(AppImages.containerMaskImg,fit: BoxFit.cover,)
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                          child: Text(controller.landingCardsList[index].descriptionText!,overflow: TextOverflow.ellipsis,maxLines: 2,),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.containerColorLightGrey,
                            border: Border.all(color: AppColors.containerBorderColorLightGrey)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: Row(
                          children:[
                            for(var  data in controller.landingCardsList[index].actionsList!)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(data.actionImagePath!,),
                                    Text(data.actionName!,style: CustomTextSty.style10NTextColor,overflow: TextOverflow.ellipsis,maxLines: 1,),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
        );
      }
    );
  }
}

class PopupMenuItemModel{
  final String itemName;
  final String iconPath;
  final int value;
  PopupMenuItemModel({
    required this.iconPath,
    required this.itemName,
    required this.value,
  });
}
