import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_kaizen_app/src/features/admin/kaizen_theme/provider/kaizen_theme_provider.dart';
import 'package:provider/provider.dart';
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/app_images.dart';
import '../../../app_configs/text_styles.dart';
import '../../../common_widgets/custom_btn/custom_elevated_btn.dart';
import '../../../common_widgets/custom_data_table/custom_data_table.dart';
import '../../../models/kaizen_theme_model.dart';

class KaizenThemeView extends StatefulWidget {
  const KaizenThemeView({super.key});

  @override
  State<KaizenThemeView> createState() => _KaizenThemeViewState();
}

class _KaizenThemeViewState extends State<KaizenThemeView> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<KaizenThemeProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
        create: (context) => KaizenThemeProvider(),
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
                              'Kaizen Theme',
                              style: textStyleFont18W600Black(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'DashBoard | Kaizen Theme',
                              style: textStyleFont14W400Black(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: MyCustomButton(
                          name: 'Add Theme',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.08,
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
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.25,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.dark3Grey,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: AppColors.dark3Grey, width: 1),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.search, size: 20),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 14),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: "Search",
                                              border: InputBorder.none,
                                            ),
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 300),
                          child: CustomDataTableWidget<KaizenThemeTableModel>(
                            data: controller.newData,
                            columnTitles: const [
                              '  Id',
                              'Name',
                              'Sort Order',
                              'Status',
                            ],
                            columnBuilders: [
                              (data) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(data.id, style: textStyle()),
                                  ),
                              (data) => Text(data.name, style: textStyle()),
                              (data) => Text(data.sortNo, style: textStyle()),
                              (data) => Text(
                                    data.status,
                                    style: TextStyle(
                                      color: data.status == 'Pending'
                                          ? AppColors.redColor
                                          : AppColors.greenColor,
                                      fontWeight: FontWeight.w500,
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
