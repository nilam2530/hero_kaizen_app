import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  String? selectedPlant;
  String? selectedDepartment;
  String? selectedSection;
  String? selectedLineArea;
  String? selectedEquipmentType;
  String? selectedEquipmentName;
  String? selectedReason;
  String? selectedBenefits;
  String? selectedFrom;
  String? selectedTime;
  String? selectedInitiatorMobile;
  String? selectedInitiatorExtension;

  TextEditingController dateController = TextEditingController();

  String improvementIdea = '';

  bool isFirstChecked = false;
  bool isSecondChecked = false;

  final List<String> pickupAddresses = ['Address 1', 'Address 2', 'Address 3'];
  final List<String> plantName = ['Gurugram', 'Jaipur', 'Delhi'];
  final List<String> deparmentDropDown = ['Honda', 'Hero', 'Crop'];
  final List<String> section = ['Section1', 'Section2', 'Section3'];
  final List<String> lineArea = ['India', 'Pak', 'China'];
  final List<String> typeOfEquipment = ['Type1', 'Type2', 'Type3'];
  final List<String> equipmentName = ['Name1', 'Name2', 'Name3'];
  final List<String> reasonForModification = [
    'Modification1',
    'Modification2',
    'Modification3'
  ];
  final List<String> exceptedBenefits = ['Benefits1', 'Benefits2', 'Benefits3'];
  final List<String> fromDropDown = ['From', 'From2', 'From3'];
  final List<String> times = ['Time 1', 'Time 2', 'Time 3'];
  final List<String> initiatorMobiles = ['Mobile 1', 'Mobile 2'];
  final List<String> initiatorExtensions = ['Extension 1', 'Extension 2'];

  void setSelectedPlant(String? value) {
    selectedPlant = value;
    notifyListeners();
  }

  void setSelectedDepartment(String? value) {
    selectedDepartment = value;
    notifyListeners();
  }

  void setSelectedSection(String? value) {
    selectedSection = value;
    notifyListeners();
  }

  void setSelectedLineArea(String? value) {
    selectedLineArea = value;
    notifyListeners();
  }

  void setSelectedEquipmentType(String? value) {
    selectedEquipmentType = value;
    notifyListeners();
  }

  void setSelectedEquipmentName(String? value) {
    selectedEquipmentName = value;
    notifyListeners();
  }

  void setSelectedReason(String? value) {
    selectedReason = value;
    notifyListeners();
  }

  void setSelectedBenefits(String? value) {
    selectedBenefits = value;
    notifyListeners();
  }

  void setSelectedFrom(String? value) {
    selectedFrom = value;
    notifyListeners();
  }

  void setSelectedTime(String? value) {
    selectedTime = value;
    notifyListeners();
  }

  void setSelectedInitiatorMobile(String? value) {
    selectedInitiatorMobile = value;
    notifyListeners();
  }

  void setSelectedInitiatorExtension(String? value) {
    selectedInitiatorExtension = value;
    notifyListeners();
  }

  // Checkbox methods
  void toggleFirstCheckbox(bool value) {
    isFirstChecked = value;
    notifyListeners();
  }

  void toggleSecondCheckbox(bool value) {
    isSecondChecked = value;
    notifyListeners();
  }

  void updateImpactDescription(String value) {
    improvementIdea = value;
    notifyListeners();
  }

  void updateTargetDate(DateTime date) {
    dateController.text = date.toIso8601String().split('T')[0];
    notifyListeners();
  }

  bool isFormValid() {
    return selectedPlant != null &&
        selectedDepartment != null &&
        selectedSection != null &&
        selectedLineArea != null &&
        selectedEquipmentType != null &&
        selectedEquipmentName != null &&
        selectedReason != null &&
        selectedBenefits != null &&
        selectedFrom != null &&
        selectedTime != null &&
        selectedInitiatorMobile != null &&
        selectedInitiatorExtension != null &&
        improvementIdea.isNotEmpty &&
        isFirstChecked &&
        isSecondChecked;
  }

  void submitForm(BuildContext context) {
    if (isFormValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all required fields')),
      );
    }
  }
}
