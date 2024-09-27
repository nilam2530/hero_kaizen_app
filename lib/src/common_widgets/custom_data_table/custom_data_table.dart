import 'package:flutter/material.dart';
import 'package:hero_kaizen_app/src/common_widgets/custom_data_table/provider/custom_data_table_provider.dart';
import 'package:provider/provider.dart';

class CustomDataTableWidget<T> extends StatelessWidget {
  final List<T> data;
  final List<String> columnTitles;
  final List<Widget Function(T)> columnBuilders;
  final List<Widget> Function(T)? expandedContentBuilder;
  final int rowsPerPage;
  final TextStyle? headerStyle;
  final TextStyle? cellStyle;
  final TextStyle? columnTitlesStyle;
  final bool expandableRows;
  final Color? evenRowColor;
  final Color? oddRowColor;
  final String Function(T)? statusExtractor;

  const CustomDataTableWidget({
    super.key,
    required this.data,
    required this.columnTitles,
    required this.columnBuilders,
    this.expandedContentBuilder,
    this.rowsPerPage = 10,
    this.headerStyle,
    this.cellStyle,
    this.expandableRows = false,
    this.statusExtractor,
    this.columnTitlesStyle,
    this.evenRowColor = const Color(0xFFF0F0F0),
    this.oddRowColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;  // Determine if mobile

    return isMobile ? _buildMobileLayout(context) : _buildTableLayout(context);
  }

  // Builds the table layout for larger screens
  Widget _buildTableLayout(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CustomDataTableProvider(),
      child: Consumer<CustomDataTableProvider>(
        builder: (context, provider, child) {
          final paginatedData = data
              .skip(provider.currentPage * rowsPerPage)
              .take(rowsPerPage)
              .toList();
          final totalPages = (data.length / rowsPerPage).ceil();

          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                _buildHeaderRow(false),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        paginatedData.length,
                            (index) {
                          final dataItem = paginatedData[index];
                          final actualIndex =
                              provider.currentPage * rowsPerPage + index;
                          final isExpanded = provider.expandedRows.contains(actualIndex);
                          return Column(
                            children: [
                              _buildDataRow(context, dataItem, actualIndex, isExpanded, false),
                              if (isExpanded && expandedContentBuilder != null)
                                _buildExpandedRow(dataItem, false),
                              Divider(thickness: 1, height: 1, color: Colors.grey[300]),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                _buildPaginationControls(context, totalPages, false),
              ],
            ),
          );
        },
      ),
    );
  }

  // Builds the column layout for mobile
  Widget _buildMobileLayout(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final dataItem = data[index];
        return Card(
          color: Colors.white,
          elevation: 2,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(columnTitles.length, (columnIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Text(
                            '${columnTitles[columnIndex]}: ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            decoration: BoxDecoration(
                              color: index % 2 == 0 ? evenRowColor : oddRowColor,

                            ),
                            child: columnBuilders[columnIndex](dataItem)),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  // Header row for table layout
  Widget _buildHeaderRow(bool isMobile) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.symmetric(vertical: isMobile ? 8.0 : 12.0),
      child: Row(
        children: List.generate(columnTitles.length + 1, (index) {
          if (index == columnTitles.length) {
            return const Expanded(
              child: Text(
                'Action',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            );
          }
          return Expanded(
            child: Text(
              columnTitles[index],
              style: headerStyle ?? TextStyle(fontWeight: FontWeight.w500, fontSize: isMobile ? 12 : 14),
            ),
          );
        }),
      ),
    );
  }

  // Data row for table layout
  Widget _buildDataRow(BuildContext context, T dataItem, int index, bool isExpanded, bool isMobile) {
    final provider = context.read<CustomDataTableProvider>();
    return GestureDetector(
      onTap: expandableRows ? () => provider.toggleRowExpansion(index) : null,
      child: Container(
        color: index % 2 == 0 ? evenRowColor : oddRowColor,
        padding: EdgeInsets.symmetric(vertical: isMobile ? 4.0 : 8.0),
        child: Row(
          children: List.generate(columnBuilders.length + 1, (columnIndex) {
            if (columnIndex == columnBuilders.length) {
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 16,
                      ),
                      onPressed: () {
                        provider.toggleRowExpansion(index);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 16,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            }
            return Expanded(
              child: DefaultTextStyle(
                style: cellStyle ?? TextStyle(fontSize: isMobile ? 12 : 14),
                child: columnBuilders[columnIndex](dataItem),
              ),
            );
          }),
        ),
      ),
    );
  }

  // Expanded row content for table layout
  Widget _buildExpandedRow(T dataItem, bool isMobile) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 4.0 : 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: expandedContentBuilder!(dataItem),
      ),
    );
  }

  // Pagination controls for table layout
  Widget _buildPaginationControls(BuildContext context, int totalPages, bool isMobile) {
    final provider = context.read<CustomDataTableProvider>();
    return Padding(
      padding: EdgeInsets.all(isMobile ? 4.0 : 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Page ${provider.currentPage + 1} of $totalPages', style: TextStyle(fontSize: isMobile ? 12 : 14)),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                ),
                onPressed: provider.currentPage > 0
                    ? () {
                  provider.goToPreviousPage();
                }
                    : null,
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onPressed: provider.currentPage < totalPages - 1
                    ? () {
                  provider.goToNextPage(totalPages);
                }
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
