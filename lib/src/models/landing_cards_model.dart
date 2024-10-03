import 'dart:ui';

class LandingCardModel{
  String?categoryName;
  String?titleName;
  String?descriptionText;
  String?cardMainImage;
  List<ActionItemsModel>?actionsList=[];
  LandingCardModel(
      {this.categoryName,
      this.titleName,
      this.descriptionText,
      this.cardMainImage,
      this.actionsList});
}

class ActionItemsModel{
  String?actionName;
  String?actionImagePath;
  VoidCallback?callBack;
  ActionItemsModel({this.actionName, this.actionImagePath, this.callBack});
}