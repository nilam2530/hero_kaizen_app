import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/app_images.dart';
import '../../../app_configs/text_styles.dart';
import '../../../common_widgets/custom_btn/custom_elevated_btn.dart';
import '../../../common_widgets/custom_data_table/custom_data_table.dart';
import '../../../models/kaizen_theme_model.dart';
import 'provider/kaizen_machine_provider.dart';

class KaizenMachineView extends StatefulWidget {
  const KaizenMachineView({super.key});

  @override
  State<KaizenMachineView> createState() => _KaizenMachineViewState();
}

class _KaizenMachineViewState extends State<KaizenMachineView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<KaizenMachineProvider>(context);
    return ChangeNotifierProvider(
        create: (context) => KaizenMachineProvider(),
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
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
                              'Kaizen Machine',
                              style: textStyleFont18W600Black(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Home | Equipment Machine',
                              style: textStyleFont14W400Black(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: MyCustomButton(
                          name: 'Add Machine',
                          textColor: AppColors.whiteColor,
                          icon: Image.asset(AppImages.addNew,
                              width: 16, height: 16),
                          btnColor: AppColors.darkMaron,
                          onTap: () {
                            GoRouter.of(context).go('/kaizenAddTheme');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: AppColors.lightGrey),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "List Record",
                            style: textStyleFont14W400Black(),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0), // Adjust padding as needed
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .end, // Align the button to the right
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Trigger the reset function in the provider
                                  controller.resetData();
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Reset",
                                      style: textStyleFont14W400White(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 300),
                          child: CustomDataTableWidget<KaizenThemeTableModel>(
                            data: controller.newData,
                            columnTitles: const [
                              '  Id',
                              'Department Name',
                              'Section Name',
                              'Cell Name',
                              'SAP Code',
                              'Sort Order',
                              'Status',
                            ],
                            columnBuilders: [
                              (data) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(data.id, style: textStyle()),
                                  ),
                              (data) => Text(data.name, style: textStyle()),
                              (data) => Text(data.name, style: textStyle()),
                              (data) => Text(data.sortNo, style: textStyle()),
                              (data) => Padding(
                                    padding: EdgeInsets.only(
                                        left: 60.h, right: 60.h),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      decoration: BoxDecoration(
                                        color: data.status == 'Enable'
                                            ? Colors.green
                                            : AppColors
                                                .redColor, // Set background color for "Enable"
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(
                                        child: Text(
                                          data.status,
                                          style: TextStyle(
                                            color: data.status == 'Enable'
                                                ? Colors.white
                                                : AppColors
                                                    .redColor, // Set text color to white for "Enable"
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                            expandedContentBuilder: (data) => [
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(data.action, style: textStyle()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
