import 'package:flutter/widgets.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';
import 'package:hero_kaizen_app/src/features/landing_dashboard/dashboard_category_cards_view.dart';
import 'package:hero_kaizen_app/src/models/landing_cards_model.dart';

class LandingDashboardCOntroller with ChangeNotifier{
  List<String> sliderIMage = [
    AppImages.testBikeBanner,
    AppImages.testBikeBanner,
    AppImages.testBikeBanner,
    AppImages.testBikeBanner,
  ];
  List<PopupMenuItemModel>? popMenuItemList=[
    PopupMenuItemModel(iconPath: AppImages.userManualPopupIcon, itemName: "User Manual", value: 1),
    PopupMenuItemModel(iconPath: AppImages.videosPopupIcon, itemName: "Videos", value: 2),
    PopupMenuItemModel(iconPath: AppImages.removeFavoritePopupIcon, itemName: "Remove From Favourites", value: 3),
  ];
  int selectedTabIndex=0;
  setTabIndexValue(int v){
    selectedTabIndex = v;
    notifyListeners();
  }

  String ?selectedCategory;
  changeCategoryName(String val){
    selectedCategory = val;
    notifyListeners();
  }
  get menuStringValue=> selectedMenuOption;
  String selectedMenuOption = "";
  clickedOnHelpContainer(String str){
    selectedMenuOption = str;
    notifyListeners();
  }

  List<LandingCardModel> landingCardsList=[
    LandingCardModel(
        titleName: "Inbound Logistics",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.inboundLogisticsIcon,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),
    LandingCardModel(
        titleName: "Employee Compliance Application",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.employeeComplianceApplication,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),


    LandingCardModel(
        titleName: "Quality Alert System",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.qualityAlertSystem,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),
    LandingCardModel(
        titleName: "Kaizen System",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.kaizenSystem,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),
    LandingCardModel(
        titleName: "Injury Identification System",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.injuryIdentificationSystem,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),
    LandingCardModel(
        titleName: "Tag Redressal System",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.tagRedressalSystem,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),
    LandingCardModel(
        titleName: "One Point Lesson (OPL)",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.onePointLessonOPL,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),
    LandingCardModel(
        titleName: "SOP System - SS&SC Function",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.sopSystem,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),
    LandingCardModel(
        titleName: "SOP System - Project Engineering",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.sopSystemProjectEngineer,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),


    LandingCardModel(
        titleName: "Hazard Identification Redressal System",
        categoryName: "Category",
        descriptionText: "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage:AppImages.hazardIdentification,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.createIcon,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.reportIcon,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.reportView,
          ),
        ]
    ),


  ];
}