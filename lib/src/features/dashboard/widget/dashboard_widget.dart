import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/app_images.dart';
import '../../../app_configs/custom_style.dart';
import '../../../common_widgets/custom_btn/custom_elevated_btn.dart';
import '../../../common_widgets/data_table.dart';
import '../../../common_widgets/filter/fitter.dart';
import '../../../common_widgets/summary_card.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with SingleTickerProviderStateMixin {
  bool isDrawerOpen = false;
  bool isExpanded = false;
  final GlobalKey _buttonKey = GlobalKey();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  late TabController _tabController;
  int selectedTabIndex = 0;
  Size? screenSIze;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;


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
      backgroundColor: AppColors.backgroundColorDash,
      body: Padding(padding: EdgeInsets.only(left: 30, right: 30),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 800;
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20,top: 5),
                      child: Column(
                        children: [

                          isMobile ? SizedBox(
                            height: size.height * .170,
                            child: _buildSummaryCardsInGrid(),
                          )
                              : _buildSummaryCards(isMobile),
                          _buildRequestAndActions(isMobile),
                          SizedBox(height: 5),
                          Expanded(
                              child: Expanded(child: DataTableWidget()),

                              )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
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

  Widget _buildRequestAndActions(bool isMobile) {
    screenSIze = MediaQuery.of(context).size;
    return Row(
      children: [
        Text("Request",style: CustomTextSty.mTextStyle20black500),
        if (!isMobile) const Spacer(),
         SizedBox(width: 10.w),
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
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: SizedBox(
            width: 120,
            child: MyCustomButton(
              name: 'Bulk Download',
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
      ],
    );
  }
}


