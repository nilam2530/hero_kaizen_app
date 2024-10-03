import 'package:flutter/widgets.dart';

import '../../app_configs/app_images.dart';
import '../../models/landing_card_model.dart';

class LandingController with ChangeNotifier {
  List<LandingCardModel> landingCardsList = [
    LandingCardModel(
        titleName: "Inbound Logistics",
        categoryName: "Category",
        descriptionText:
            "Lorem ipsum dolor sit amet consectetur. Nulla turpis laoreet vehicula urna et mauris... ",
        cardMainImage: AppImages.yellowPlus,
        actionsList: [
          ActionItemsModel(
            actionName: "Create",
            actionImagePath: AppImages.greenPlus,
          ),
          ActionItemsModel(
            actionName: "Report",
            actionImagePath: AppImages.increaseSen,
          ),
          ActionItemsModel(
            actionName: "View",
            actionImagePath: AppImages.actionEye,
          ),
        ]),
  ];
}
