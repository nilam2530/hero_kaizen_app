import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_kaizen_app/src/features/kaizen_support_dashboard/test_app_banner.dart';
import 'package:provider/provider.dart';

import '../../app_configs/app_colors.dart';
import '../../app_configs/app_images.dart';
import '../../app_configs/custom_style.dart';
import '../../common_widgets/carousel/custom_carousel.dart';

class PreviewRequest extends StatefulWidget {
  const PreviewRequest({super.key});

  @override
  State<PreviewRequest> createState() => _PreviewRequestState();
}

class _PreviewRequestState extends State<PreviewRequest>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0;
  }

  Size? size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<LandingController>(
        create: (ctx) => LandingController(),
        builder: (context, snapshot) {
          return Scaffold(
            body: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // padding: const EdgeInsets.all(12),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Dashboard",
                              style: CustomTextSty.style25Bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 250,
                          child: CustomCarousel(
                            images: const [
                              AppImages.bikeCarousel,
                              AppImages.bikeCarousel,
                              AppImages.bikeCarousel,
                            ],
                            texts: const [
                              'HERO MOTOCORP CONCLUDES THE\nCENTENNIAL AUCTION WITH\nRESOUNDING SUCCESS',
                              'HERO MOTOCORP CONCLUDES THE\nCENTENNIAL AUCTION WITH\nRESOUNDING SUCCESS',
                              'HERO MOTOCORP CONCLUDES THE\nCENTENNIAL AUCTION WITH\nRESOUNDING SUCCESS',
                            ],
                            buttonCallbacks: [
                              () {},
                              () {},
                              () {},
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "My Applications",
                          style: CustomTextSty.style16Bold400,
                        ),
                      ),
                      TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        automaticIndicatorColorAdjustment: true,
                        onTap: (val) {
                          _tabController.index = val;
                          setState(() {});
                        },
                        tabs: const [
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("My Favourite Application"),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("All Application"),
                            ),
                          ),
                        ],
                        tabAlignment: TabAlignment.start,
                        labelStyle: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width > 600 ? 16 : 14,
                          color: AppColors.whiteColor,
                        ),
                        dividerColor: Colors.transparent,
                        unselectedLabelStyle: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width > 600 ? 18 : 16,
                        ),
                        indicator: const BoxDecoration(
                          color: AppColors.btnRedColor,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Builder(builder: (_) {
                        if (_tabController.index == 0) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      (MediaQuery.of(context).size.width / 400)
                                          .floor(),
                                  childAspectRatio: 1.7,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                                itemCount: 8,
                                itemBuilder: (context, index) =>
                                    const CustomCardWidget(
                                        backgroundImagePath:
                                            AppImages.maskGroup),
                              ),
                            ),
                          );
                        } else if (_tabController.index == 1) {
                          return ListView.builder(
                              itemCount: 50,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Text(index.toString());
                              });
                        }
                        return const Text("sorry");
                      }),
                    ],
                  ),
                );
              }
              return const Text("Mobile view desing not abviable");
            }),
          );
        });
  }
}

class CustomCardWidget extends StatelessWidget {
  final String backgroundImagePath;

  const CustomCardWidget({super.key, required this.backgroundImagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.dark2Grey),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.darBlack,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Machine",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "HM26/2024/1274",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3.1,
                              mainAxisSpacing: 8),
                      children: [
                        _buildDetailItem("Initiator", "Bivash Dey"),
                        _buildDetailItem("Created At", "04 Sept 2024"),
                        _buildDetailItem("Type Of Equipment", "Machine"),
                        _buildDetailItem("Department", "Engine Plant"),
                        _buildDetailItem("Initiator", "Bivash Dey"),
                        _buildDetailItem("Created At", "04 Sept 2024"),
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(
                  height: 165,
                  backgroundImagePath,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const Divider(height: 1.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 223, 108, 0.16),
                    ),
                    child: const Center(
                      child: Text(
                        "Pending with Section Head",
                        style: TextStyle(
                          color: Color(0xFFDA700E),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  SvgPicture.asset(AppImages.bulkDownload),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
