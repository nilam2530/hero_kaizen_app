import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../app_configs/app_colors.dart';
import '../../../app_configs/app_images.dart';
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

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

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
                      _buildHeader(context),
                      SizedBox(height: isMobile ? 8 : 10),
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
                            const SizedBox(height: 10),
                            _buildSearchAndActions(isMobile),
                            const SizedBox(height: 10),
                            const Expanded(child: DataTableWidget()),
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

  Row _buildHeader(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Dashboard",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.darBlack,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await _pickDate(context);
            if (_selectedDate != null) {
              await _pickTime(context);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
              color: AppColors.greyBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              children: [
                Text(
                  '${DateFormat('MMM yyyy').format(_selectedDate ?? DateTime.now())} at ${_selectedTime != null ? _selectedTime!.format(context) : TimeOfDay.now().format(context)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.darBlack,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.keyboard_arrow_down_outlined, size: 16),
              ],
            ),
          ),
        ),
      ],
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

  Widget _buildSearchAndActions(bool isMobile) {
    screenSIze = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
            child: Container(
          width: screenSIze!.width * .2,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
            color: AppColors.dark3Grey,
            border: Border.all(
              color: AppColors.dark3Grey,
              width: 1.0,
            ),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.search, size: 20),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
        if (!isMobile) const Spacer(),
        const SizedBox(width: 16),
        const SizedBox(width: 16),
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


