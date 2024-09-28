import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/text_styles.dart';
import '../../../common_widgets/animated_customwidgets/animatedCustomDropDown.dart';
import '../../../common_widgets/custom_fields/text/custom_text_field.dart';
import '../../../models/pillar_model.dart';
import '../kaizen_benefit/provider/kaizen_benefit_provider.dart';

class AddLoss extends StatefulWidget {
  const AddLoss({super.key});

  @override
  State<AddLoss> createState() => _AddLossState();
}

class _AddLossState extends State<AddLoss> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<KaizenBenefitProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                        Text('Add Loss', style: textStyleFont18W600Black()),
                        const SizedBox(height: 5),
                        Text(
                          'DashBoard | Kaizen Theme | Add Loss',
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
                            GoRouter.of(context).go('/kaizenLoss');
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
                            child: Center(
                              child: Text(
                                "Back",
                                style: textStyleFont14W400White(),
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
                            if (_validateFields(controller)) {
                              controller.addNewTheme(
                                name: controller.nameController.text,
                                sortOrder: controller.sortOrderController.text,
                                status: "Pending",
                              );
                              GoRouter.of(context).go('/kaizenLoss');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                  "Please fill all fields",
                                )),
                              );
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: AppColors.sucessful,
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text("Save",
                                  style: textStyleFont14W400White()),
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

  bool _validateFields(KaizenBenefitProvider controller) {
    return controller.nameController.text.trim().isNotEmpty &&
        controller.selectetThemeStatus.trim().isNotEmpty &&
        controller.sortOrderController.text.trim().isNotEmpty;
  }

  Widget _buildFormFields(KaizenBenefitProvider controller) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                "Loss No: ",
                style: textStyleFont14W400Black(),
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: controller.nameController,
                labelText: 'Loss No',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Add loss no';
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
              child: Text("Loss Name: ", style: textStyleFont14W400Black()),
            ),
            Expanded(
              child: CustomTextField(
                controller: controller.nameController,
                labelText: 'Loss name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Add loss no';
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
              child: Text("Status: ", style: textStyleFont14W400Black()),
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
              child: Text("Sort Order: ", style: textStyleFont14W400Black()),
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
