import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_kaizen_app/src/features/admin/kaizen_benefit/provider/kaizen_benefit_provider.dart';
import 'package:provider/provider.dart';
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/text_styles.dart';
import '../../../common_widgets/animated_customwidgets/animatedCustomDropDown.dart';
import '../../../common_widgets/custom_fields/text/custom_text_field.dart';
import '../../../models/pillar_model.dart';

class AddBenefitView extends StatefulWidget {
  const AddBenefitView({super.key});

  @override
  State<AddBenefitView> createState() => _AddBenefitViewState();
}

class _AddBenefitViewState extends State<AddBenefitView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<KaizenBenefitProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 600; // Treat width < 600px as mobile
    return Scaffold(
      backgroundColor: AppColors.darkGrey.withOpacity(0.2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(1.0),
                child: isMobile
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add New Unit Measurement',
                                  style: textStyleFont18W600Black(),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'HOme | Kaizen Unit Measurement | Add',
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
                                    GoRouter.of(context).go('/kaizenBenefit');
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        border: Border.all(
                                            width: 0.5,
                                            color:
                                                AppColors.outlineBorderColor),
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
                                        sortOrder:
                                            controller.sortOrderController.text,
                                        status: "Pending",
                                      );
                                      GoRouter.of(context).go('/kaizenTheme');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add New Theme',
                                  style: textStyleFont18W600Black(),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'DashBoard | Kaizen Theme | Add New Theme',
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
                                    GoRouter.of(context).go('/kaizenBenefit');
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        border: Border.all(
                                            width: 0.5,
                                            color:
                                                AppColors.outlineBorderColor),
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
                                        sortOrder:
                                            controller.sortOrderController.text,
                                        status: "Pending",
                                      );
                                      GoRouter.of(context).go('/kaizenBenefit');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                      )),
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 200,
          decoration: const BoxDecoration(
              // border: Border.all(
              //   width: 0.5,
              //   color: AppColors.outlineBorderColor,
              // ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
              color: Colors.white),
          child: const Text("General"),
        ),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Name: ",
                        style: textStyleFont14W400Black(),
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: controller.nameController,
                        labelText: 'name',
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
                        "Status: ",
                        style: textStyleFont14W400Black(),
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
            ),
          ),
        ),
      ],
    );
  }
}
