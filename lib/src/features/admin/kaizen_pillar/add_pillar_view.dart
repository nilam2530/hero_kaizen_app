import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_kaizen_app/src/features/admin/kaizen_pillar/provider/kaizen_pillar_controller.dart';
import 'package:provider/provider.dart';
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/text_styles.dart';
import '../../../common_widgets/animated_customwidgets/animatedCustomDropDown.dart';
import '../../../common_widgets/custom_fields/text/custom_text_field.dart';
import '../../../models/pillar_model.dart';

class AddPillarView extends StatefulWidget {
  const AddPillarView({super.key});

  @override
  State<AddPillarView> createState() => _AddPillarViewState();
}

class _AddPillarViewState extends State<AddPillarView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<KaizenProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding:  const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add New Pillar',
                          style: textStyleFont18W600Black()
                        ),
                        const SizedBox(height: 5),
                         Text(
                          'DashBoard | Kaizen Pillar | Add Pillar',
                          style: textStyleFont14W400Black(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/shivendra');
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.outlineBorderColor),
                                borderRadius: BorderRadius.circular(6)),
                            child:  Center(
                              child: Text(
                                "Back",
                                style: textStyleFont14W400White()
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Trigger saving data via provider
                            if (_validateFields(controller)) {
                              controller.addNewPillar(
                                plantName: controller.plantNameController.text,
                                pillarName: controller.pillarNameController.text,
                                pillarHeadECNo: controller.pillarHeadECNoController.text,
                                sortOrder: controller.sortOrderController.text,
                                status: "Pending",  // or any other status you want to assign
                              );
                              GoRouter.of(context).go('/shivendra');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please fill all fields")),
                              );
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: AppColors.sucessful,
                                borderRadius: BorderRadius.circular(6)),
                            child:  Center(
                              child: Text(
                                "Save",
                                style: textStyleFont14W400White(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            _buildFormFields(controller),
          ],
        ),
      ),
    );
  }

  bool _validateFields(KaizenProvider controller) {
    return controller.plantNameController.text.trim().isNotEmpty &&
        controller.pillarNameController.text.trim().isNotEmpty &&
        controller.selectedPillarHead.trim().isNotEmpty &&
        controller.pillarHeadECNoController.text.trim().isNotEmpty &&
        controller.sortOrderController.text.trim().isNotEmpty;
  }

  Widget _buildFormFields(KaizenProvider controller) {
    return Column(
      children: [
        Row(
          children: [
             SizedBox(
              width: 100,
              child: Text(
                "Plant Name: ",
                style: textStyleFont14W400Black(),
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: controller.plantNameController,
                labelText: 'Plant Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Add Plant Name';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onSaved: (String? value) {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
             SizedBox(
              width: 100,
              child: Text(
                "Pillar Name: ",
                style: textStyleFont14W400Black()
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: controller.pillarNameController,
                labelText: 'Pillar Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Add Pillar Name';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onSaved: (String? value) {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
             SizedBox(
              width: 100,
              child: Text(
                "Select Pillar Head: ",
                style: textStyleFont14W400Black()
              ),
            ),
            Expanded(
              child: CustomAnimatedDropdown<PillarModel>(
                items: controller.pillarModel,
                itemAsString: (pillar) => pillar.title,
                onChanged: (value) {
                  controller.setSelectedPillarHead(value?.title ?? '');
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
             SizedBox(
              width: 100,
              child: Text(
                "Pillar Head EC No: ",
                style: textStyleFont14W400Black(),
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: controller.pillarHeadECNoController,
                labelText: 'Pillar Head EC No',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Add Pillar Head EC No';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onSaved: (String? value) {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
             SizedBox(
              width: 100,
              child: Text(
                "Sort Order: ",
                style: textStyleFont14W400Black(),
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: controller.sortOrderController,
                labelText: 'Sort Order',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Add Sort Order';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                onSaved: (String? value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
