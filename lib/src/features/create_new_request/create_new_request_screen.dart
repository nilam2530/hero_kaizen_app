import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../app_configs/app_colors.dart';
import '../../app_configs/app_images.dart';
import '../../app_configs/custom_style.dart';
import '../../common_widgets/custom_btn/custom_elevated_btn.dart';
import '../../common_widgets/custom_drop_down/custom_drop_down.dart';
import '../../common_widgets/custom_fields/text/custom_text_field.dart';
import 'provider/create_new_request_provider.dart';

class CreateNewRequestDesktopScreen extends StatelessWidget {
  const CreateNewRequestDesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormProvider(),
      child: Consumer<FormProvider>(
        builder: (context, formProvider, _) {
          Size screenSize = MediaQuery.of(context).size;

          return Scaffold(
            backgroundColor: AppColors.greyBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleSection(),
                    const SizedBox(height: 20),
                    _buildFormContainer(context, formProvider, screenSize),
                    const SizedBox(height: 15),
                    _buildActionButtons(context, formProvider),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitleSection() {
    return const Text(
      'Create New Request',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFormContainer(
      BuildContext context, FormProvider formProvider, Size screenSize) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.dark2Grey),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (screenSize.width > 600)
            _buildDropdownFields(formProvider, context),
          const SizedBox(height: 10),
          _buildCheckboxes(formProvider),
        ],
      ),
    );
  }

  Widget _buildDropdownFields(FormProvider formProvider, BuildContext context) {
    return Column(
      children: [
        _plantRow(
          formProvider,
          'Plant Name',
          'Department',
          'Section',
          formProvider.selectedPlant,
          formProvider.selectedDepartment,
          formProvider.selectedSection,
          formProvider.setSelectedPlant,
          formProvider.setSelectedDepartment,
          formProvider.setSelectedSection,
        ),
        const SizedBox(height: 10),
        _lineAreaRow(
          formProvider,
          'Line/Area',
          'Type Of Equipment',
          'Equipment Name',
          formProvider.selectedLineArea,
          formProvider.selectedEquipmentType,
          formProvider.selectedEquipmentName,
          formProvider.setSelectedLineArea,
          formProvider.setSelectedEquipmentType,
          formProvider.setSelectedEquipmentName,
        ),
        const SizedBox(height: 10),
        _reasonForModificationRow(
          formProvider,
          'Reason For Modification',
          'Expected Benefits',
          'From',
          formProvider.selectedReason,
          formProvider.selectedBenefits,
          formProvider.selectedFrom,
          formProvider.setSelectedReason,
          formProvider.setSelectedBenefits,
          formProvider.setSelectedFrom,
        ),
        const SizedBox(height: 10),
        _buildDatePickerAndTimeRow(formProvider, context),
        const SizedBox(height: 10),
        _buildInitiatorFields(formProvider),
        const SizedBox(height: 10),
        _buildImprovementIdeaField(formProvider),
      ],
    );
  }

  Widget _plantRow(
    FormProvider formProvider,
    String field1,
    String field2,
    String field3,
    String? selectedValue1,
    String? selectedValue2,
    String? selectedValue3,
    Function(String?) onChanged1,
    Function(String?) onChanged2,
    Function(String?) onChanged3,
  ) {
    return Row(
      children: [
        _buildFlexibleDropdown(
            field1, selectedValue1, formProvider.plantName, onChanged1),
        const SizedBox(width: 10),
        _buildFlexibleDropdown(
            field2, selectedValue2, formProvider.deparmentDropDown, onChanged2),
        const SizedBox(width: 10),
        _buildFlexibleDropdown(
            field3, selectedValue3, formProvider.section, onChanged3),
      ],
    );
  }

  Widget _lineAreaRow(
    FormProvider formProvider,
    String field4,
    String field5,
    String field6,
    String? selectedValue4,
    String? selectedValue5,
    String? selectedValue6,
    Function(String?) onChanged4,
    Function(String?) onChanged5,
    Function(String?) onChanged6,
  ) {
    return Row(
      children: [
        _buildFlexibleDropdown(
            field4, selectedValue4, formProvider.lineArea, onChanged4),
        const SizedBox(width: 10),
        _buildFlexibleDropdown(
            field5, selectedValue5, formProvider.typeOfEquipment, onChanged5),
        const SizedBox(width: 10),
        _buildFlexibleDropdown(
            field6, selectedValue6, formProvider.equipmentName, onChanged6),
      ],
    );
  }

  Widget _reasonForModificationRow(
    FormProvider formProvider,
    String field7,
    String field8,
    String field9,
    String? selectedValue7,
    String? selectedValue8,
    String? selectedValue9,
    Function(String?) onChanged7,
    Function(String?) onChanged8,
    Function(String?) onChanged9,
  ) {
    return Row(
      children: [
        _buildFlexibleDropdown(field7, selectedValue7,
            formProvider.reasonForModification, onChanged7),
        const SizedBox(width: 10),
        _buildFlexibleDropdown(
            field8, selectedValue8, formProvider.exceptedBenefits, onChanged8),
        const SizedBox(width: 10),
        _buildFlexibleDropdown(
            field9, selectedValue9, formProvider.fromDropDown, onChanged9),
      ],
    );
  }

  Widget _buildFlexibleDropdown(String label, String? selectedValue,
      List<String> items, Function(String?) onChanged) {
    return Expanded(
      child: CustomDropdown<String>(
        label: label,
        value: selectedValue,
        items: items,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDatePickerAndTimeRow(
      FormProvider formProvider, BuildContext context) {
    return Row(
      children: [
        _buildFlexibleDropdown('Proposed Time', formProvider.selectedTime,
            formProvider.times, formProvider.setSelectedTime),
        const SizedBox(width: 10),
        _buildDateField(formProvider, 'Select target date', context),
      ],
    );
  }

  Widget _buildDateField(
      FormProvider formProvider, String label, BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label, style: CustomTextSty.mTextStyle14),
              const SizedBox(width: 5),
              Text('*', style: CustomTextSty.mTextStyleColor),
            ],
          ),
          CustomTextField(
            labelText: label,
            controller: formProvider.dateController,
            suffix: GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (date != null) {
                  formProvider.updateTargetDate(date);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppImages.calendar,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            onSaved: (string) {},
          ),
        ],
      ),
    );
  }

  Widget _buildInitiatorFields(FormProvider formProvider) {
    return Row(
      children: [
        _buildFlexibleDropdown(
            'Initiator Mobile',
            formProvider.selectedInitiatorMobile,
            formProvider.initiatorMobiles,
            formProvider.setSelectedInitiatorMobile),
        const SizedBox(width: 10),
        _buildFlexibleDropdown(
            'Initiator Extension',
            formProvider.selectedInitiatorExtension,
            formProvider.initiatorExtensions,
            formProvider.setSelectedInitiatorExtension),
      ],
    );
  }

  Widget _buildImprovementIdeaField(FormProvider formProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Improvement Idea', style: CustomTextSty.mTextStyle14),
            Text('*', style: CustomTextSty.mTextStyleColor),
          ],
        ),
        const SizedBox(height: 7),
        CustomTextField(
          labelText: 'Improvement Idea',
          maxLines: 4,
          onChanged: (value) {
            formProvider.updateImpactDescription(value);
          },
          onSaved: (string) {},
        ),
      ],
    );
  }

  Widget _buildCheckboxes(FormProvider formProvider) {
    return Column(
      children: [
        _buildCheckboxRow(
          formProvider.isFirstChecked,
          formProvider.toggleFirstCheckbox,
          "I will be responsible for adherence to all the Safety Parameters when Kaizen Support Team will execute this work on Gemba.",
        ),
        _buildCheckboxRow(
          formProvider.isSecondChecked,
          formProvider.toggleSecondCheckbox,
          "After the Kaizen Support Team work is over, I will ensure the proper functioning of the Equipment to avoid any Production Loss.",
        ),
      ],
    );
  }

  Widget _buildCheckboxRow(
      bool isChecked, Function(bool) onChanged, String label) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            onChanged(value!);
          },
          side: const BorderSide(color: AppColors.dark2Grey, width: 0.5),
          activeColor: AppColors.darkMaron,
        ),
        Expanded(child: Text(label)),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, FormProvider formProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: SizedBox(
            width: 120,
            child: MyCustomButton(
              name: 'Save as Draft',
              textColor: AppColors.lightBlack,
              btnColor: AppColors.whiteColor,
              borderColor: AppColors.borderColor,
              borderWidth: 1,
              onTap: () {},
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: MyCustomButton(
            name: 'Preview',
            btnColor: AppColors.darkMaron,
            borderColor: Colors.transparent,
            borderWidth: 0,
            onTap: () {
              formProvider.submitForm(context);
            },
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
