import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_configs/app_colors.dart';
import '../app_configs/app_images.dart';
import '../models/data_table_model.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({super.key});

  @override
  DataTableWidgetState createState() => DataTableWidgetState();
}

class DataTableWidgetState extends State<DataTableWidget> {
  final int _rowsPerPage = 10;
  final Set<int> _expandedRows = <int>{};
  final List<DataTableModel> _requests = List.generate(
    30,
    (index) => DataTableModel(
      date: "20 Jun 2024",
      requestNo: "LRIB${index.toString().padLeft(5, '0')}",
      type: "Inbound",
      modeOfTransportation: "Land - Part",
      status: "Pending Request",
    ),
  );
  final Set<int> _selectedRows = <int>{};
  int _currentPage = 0;

  void _toggleRowExpansion(int index) {
    setState(() {
      if (_expandedRows.contains(index)) {
        _expandedRows.remove(index);
      } else {
        _expandedRows.add(index);
      }
    });
  }

  void _toggleRowSelection(int index) {
    setState(() {
      if (_selectedRows.contains(index)) {
        _selectedRows.remove(index);
      } else {
        _selectedRows.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginatedRequests =
        _requests.skip(_currentPage * _rowsPerPage).take(_rowsPerPage).toList();
    final totalPages = (_requests.length / _rowsPerPage).ceil();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTableHeader(),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 0, bottom: 0),
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
                    children: [
                      _buildTableselect(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: paginatedRequests.length,
                          itemBuilder: (context, index) {
                            final request = paginatedRequests[index];
                            final actualIndex =
                                _currentPage * _rowsPerPage + index;
                            final isExpanded =
                                _expandedRows.contains(actualIndex);
                            return Column(
                              children: [
                                DataRowWidget(
                                  index: actualIndex,
                                  request: request,
                                  isExpanded: isExpanded,
                                  onTap: () => _toggleRowExpansion(actualIndex),
                                  isSelected:
                                      _selectedRows.contains(actualIndex),
                                  onSelect: () =>
                                      _toggleRowSelection(actualIndex),
                                ),
                                if (isExpanded) _buildExpandedRowContent(),
                                Divider(
                                    thickness: 1,
                                    height: 1,
                                    color: Colors.grey[300]),
                              ],
                            );
                          },
                        ),
                      ),
                      _buildPaginationControls(totalPages),

                    ],
                  ))),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildHeaderCell('Kaizen No.', addCheckbox: true)),
        Expanded(child: _buildHeaderCell('Plant Name')),
        Expanded(child: _buildHeaderCell('Pillar Name')),
        Expanded(child: _buildHeaderCell('Category')),
        Expanded(child: _buildHeaderCell('Department')),
        Expanded(child: _buildHeaderCell('Loss No. & Name')),
        // Expanded(child: _buildHeaderCell('Benefit Type')),
        // Expanded(child: _buildHeaderCell('Type')),
        // Expanded(child: _buildHeaderCell('Saving Type')),
        Expanded(child: _buildHeaderCell('Created At')),
        Expanded(child: _buildHeaderCell('Status')),
        Expanded(child: _buildHeaderCell('Action')),
      ],
    );
  }

  Widget _buildTableselect() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Search", style: _textStyle()),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.fillColor)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Search", style: _textStyle()),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  children: [
                    Text("Selected", style: _textStyle()),
                    SvgPicture.asset(AppImages.dropdown),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, {bool addCheckbox = false}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (addCheckbox)
            Checkbox(
              value: _selectedRows.length == _rowsPerPage,
              onChanged: (bool? value) {
                setState(() {
                  _selectedRows.clear();
                  if (value == true) {
                    for (int i = 0; i < _rowsPerPage; i++) {
                      _selectedRows.add(i + _currentPage * _rowsPerPage);
                    }
                  }
                });
              },
            ),
          Text(text, style: _textStyle()),
          if (!addCheckbox) const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildExpandedRowContent() {
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRequestInfoColumn(),
          _buildPickupAndPackageDetailsColumn(),
        ],
      ),
    );
  }

  Widget _buildPaginationControls(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(
          children: [
            Text("Show ${_rowsPerPage} entries", style: _textStyle()),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGrey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<int>(
                value: _rowsPerPage,
                items: const [
                  DropdownMenuItem(child: Text('10'), value: 10),
                  DropdownMenuItem(child: Text('20'), value: 20),
                  DropdownMenuItem(child: Text('50'), value: 50),
                  DropdownMenuItem(child: Text('100'), value: 100),
                ],
                onChanged: (value) {
                  setState(() {
                    _currentPage = value!;
                    _currentPage = 0;
                  });
                },
              ),

            )
          ],
        ),

        Row(
            children: [
              if (_currentPage > 0)
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    setState(() {
                      _currentPage--;
                    });
                  },
                ),
              const SizedBox(width: 1),
              for (int i = 0; i < totalPages; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: InkWell(
                    onTap: _currentPage == i
                        ? null
                        : () {
                      setState(() {
                        _currentPage = i;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentPage == i ? Colors.red : Colors.transparent,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: _currentPage == i
                              ? Colors.red
                              : Colors.grey.shade400,
                        ),
                      ),
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          color: _currentPage == i ? Colors.white : Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 1),
              if (_currentPage < totalPages - 1)
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    setState(() {
                      _currentPage++;
                    });
                  },
                ),
            ]),
      ],
    );
  }
  Widget _buildRequestInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('Section', 'Dgt.Eng&Test.Dev - Rahul BHARADWAJ'),
        _buildInfoRow('Pickup Address', 'Gurugram NIT'),
        _buildInfoRow('Pickup Pincode', '122012'),
        _buildInfoRow('Destination Address', 'CIT Jaipur'),
        _buildInfoRow('Destination Pincode', '302023'),
        _buildInfoRow('Approx Weight', '2 Kg/L'),
        _buildInfoRow('Invoice Value', '1'),
        _buildInfoRow('Mode Of Transportation', 'Land - Part Truck Load'),
      ],
    );
  }

  Widget _buildPickupAndPackageDetailsColumn() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Pickup Date', '18 July 2024'),
          _buildInfoRow('Contact Person Name', 'Surendar Singh'),
          _buildInfoRow('Contact Person Mobile No.', '9081234521'),
          _buildInfoRow('Attachment', 'xls.file'),
          _buildInfoRow('Number Of Packages', '120'),
          _buildInfoRow('Package Dimensions', '4X4'),
          _buildInfoRow('Document/PO Number', 'PO10120'),
          _buildInfoRow('Special Instructions', 'TEST'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 40),
        const Text(":"),
        const SizedBox(width: 20),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      fontFamily: 'Gotham-Bold',
      fontSize: 14,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      color: AppColors.lightBlack,
    );
  }
}

class DataRowWidget extends StatelessWidget {
  final int index;
  final DataTableModel request;
  final bool isExpanded;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onSelect;

  const DataRowWidget({
    super.key,
    required this.index,
    required this.request,
    required this.isExpanded,
    required this.onTap,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: isExpanded ? Colors.blueGrey[50] : Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Checkbox(value: isSelected, onChanged: (val) => onSelect()),
                    Text("HM2G"),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Text("  Gurgaon Plant")),
              Expanded(flex: 1, child: Text("   PM")),
              Expanded(flex: 1, child: Text("   C")),
              Expanded(flex: 1, child: Text("   Engine Plant")),
              Expanded(flex: 1, child: Text("  2 & Setup")),
              Expanded(flex: 1, child: Text("  Quality")),
              Expanded(flex: 1, child: Text("Non-Contract")),
              // Expanded(child: Text("One-Time")),
              Expanded(flex: 1, child: Text(" 12 Sept 2024")),
              Expanded(
                  flex: 1, child: _buildActionIcons(AppImages.tablemulti1)),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: onTap,
                        child: Image.asset(
                          AppImages.downArrowTable,
                          height: 20,
                          width: 20,
                          color: isExpanded ? Colors.red : null,
                        ),
                      ),
                      SvgPicture.asset(AppImages.iconEyes),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionIcons(String iconPath) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 18,
          width: 18,
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
