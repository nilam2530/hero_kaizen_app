import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_kaizen_app/src/features/dashboard1/widget/dashboard_table.dart';
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/app_images.dart';
import '../../../common_widgets/custom_btn/custom_elevated_btn.dart';
import '../../../common_widgets/filter/fitter.dart';
import '../../../common_widgets/summary_card.dart';

class DashboardWidget1 extends StatefulWidget {
  const DashboardWidget1({super.key});

  @override
  State<DashboardWidget1> createState() => _DashboardWidget1State();
}

class _DashboardWidget1State extends State<DashboardWidget1> with SingleTickerProviderStateMixin {
  bool isDrawerOpen = false;
  bool isExpanded = false;
  final GlobalKey _buttonKey = GlobalKey();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  late TabController _tabController;
  int selectedTabIndex = 0;
  Size? screenSIze;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        setState(() {
          selectedTabIndex = _tabController.index;
        });
      });
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColormain,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: isMobile ? 8 : 0),
                      isMobile
                          ? SizedBox(
                        height: size.height * .175,
                        child: _buildSummaryCardsInGrid(),
                      )
                          : _buildSummaryCards(isMobile),
                      Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 0, bottom: 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 5)
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildRequest(isMobile),
                                const Expanded(child: DashboardDataTableWidget()),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }


  List<SummaryCard> summaryCard = [
    SummaryCard(
      bgImg: Image.asset(AppImages.bgImgCard1),
      imagePath: AppImages.summaryRed,
      value: '40',
      label: 'Pending Requests',
      backgroundColor: AppColors.penDingColors,
    ),
    SummaryCard(
      bgImg: Image.asset(AppImages.bgImgCard2),
      imagePath: AppImages.summaryPink,
      value: '25',
      label: 'Completed Requests',
    ),
    SummaryCard(
      bgImg: Image.asset(AppImages.bgImgCard),
      imagePath: AppImages.summaryGreen,
      value: '33',
      label: 'Completed Requests',
      backgroundColor: AppColors.rejectColors,
    ),
    SummaryCard(
      bgImg: Image.asset(AppImages.bgImgCard),
      imagePath: AppImages.summaryBlue,
      value: '435',
      label: 'Completed Requests',
      backgroundColor: AppColors.completionColors,
    ),
  ];

  Widget _buildSummaryCards(bool isMobile) {
    return Row(
      mainAxisAlignment:
      isMobile ? MainAxisAlignment.start : MainAxisAlignment.spaceAround,
      children: [for (var item in summaryCard) Expanded(child: item)],
    );
  }

  _buildSummaryCardsInGrid() {
    return ListView.builder(
      itemCount: summaryCard.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return summaryCard[index];
      },
    );
  }

  Widget _buildRequest(bool isMobile) {
    screenSIze = MediaQuery.of(context).size;
    return Row(
      children: [
        const Expanded(
              child: Text(
                "Requests",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppColors.darBlack,
                ),
              ),
            ),
        if (!isMobile) const Spacer(),
        if (!isMobile) _buildAddRequestButton(),
      ],
    );
  }

  void _showAttachedDialog(BuildContext context) {
    final RenderBox buttonBox =
    _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final buttonPosition = buttonBox.localToGlobal(Offset.zero);
    final buttonSize = buttonBox.size;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Stack(
          children: [
            Positioned(
              left: buttonPosition.dx,
              top: buttonPosition.dy + buttonSize.height - 65,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(16.0),
                child: const SizedBox(
                  width: 340,
                  height: 400,
                  child: FilterDialogContent(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAddRequestButton() {
    return Row(
      children: [
        GestureDetector(
          key: _buttonKey,
          onTap: () {
            _showAttachedDialog(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: SizedBox(
              width: 100,
              child: MyCustomButton(
                name: 'Filter',
                textColor: AppColors.lightBlack,
                icon: SvgPicture.asset(
                  AppImages.filter1,
                  width: 14,
                  height: 14,
                ),
                btnColor: AppColors.whiteColor,
                borderColor: AppColors.borderColor,
                borderWidth: 1,
                onTap: () {},
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: SizedBox(
            width: 120,
            child: MyCustomButton(
              name: 'Bulk Upload',
              textColor: AppColors.lightBlack,
              icon: SvgPicture.asset(
                AppImages.bulkDownload,
                width: 14,
                height: 14,
              ),
              btnColor: AppColors.whiteColor,
              borderColor: AppColors.borderColor,
              borderWidth: 1,
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: SizedBox(
            width: 120,
            child: MyCustomButton(
              name: 'Download',
              textColor: AppColors.lightBlack,
              icon: SvgPicture.asset(
                AppImages.bulkDownload,
                width: 14,
                height: 14,
              ),
              btnColor: AppColors.whiteColor,
              borderColor: AppColors.borderColor,
              borderWidth: 1,
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: MyCustomButton(
            name: 'Add Request ',
            textColor: AppColors.whiteColor,
            icon: Image.asset(AppImages.addNew, width: 16, height: 16),
            btnColor: AppColors.darkMaron,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}


