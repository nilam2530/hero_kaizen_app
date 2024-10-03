import 'package:flutter/material.dart';
import 'package:hero_kaizen_app/src/app_configs/app_images.dart';

class CustomMenuIconButtonScreen extends StatefulWidget {
  const CustomMenuIconButtonScreen({super.key});

  @override
  State<CustomMenuIconButtonScreen> createState() =>
      _CustomMenuIconButtonScreenState();
}

class _CustomMenuIconButtonScreenState
    extends State<CustomMenuIconButtonScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredTitles = titles; // Initialize with all items
    _searchController.addListener(_filterSearchResults);
  }

  void _filterSearchResults() {
    String query = _searchController.text.toLowerCase();
    filteredTitles =
        titles.where((title) => title.toLowerCase().contains(query)).toList();
  }

  bool isExpanded = false;
  Size? size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return _buildMenuIcon();
  }

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  Widget _buildMenuIcon() {
    return CompositedTransformTarget(
      link: _layerLink,
      child: IconButton(
        icon: Image.asset(AppImages.menuIconsDot, width: 20, height: 20),
        onPressed: () {
          isExpanded ? _overlayEntry?.remove() : _showDropdown(context);
          isExpanded = !isExpanded;
        },
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    final overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 335,
        top: kToolbarHeight + 8,
        left: size!.width > 600 ? 0 : null,
        right: size!.width < 600 ? 0 : null,
        child: Material(
          elevation: 4,
          child: _buildDropdownContent(),
        ),
      ),
    );

    overlayState.insert(_overlayEntry!);
    Future.delayed(const Duration(seconds: 5), () {
      _overlayEntry!.remove();
      isExpanded = false;
    });
  }

  Widget _buildDropdownContent() {
    final imagePaths = [
      'assets/images/inbound_logistics.png',
      'assets/images/employee_compliance.png',
      'assets/images/hira.png',
      'assets/images/injury_identification.png',
      'assets/images/tag_redressal.png',
      'assets/images/kaizen.png',
      'assets/images/opl.png',
      'assets/images/quality_alert.png',
      'assets/images/sop1.png',
      'assets/images/sop2.png',
    ];

    return Container(
      height: 488,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1),
      ),
      child: Column(
        children: [
          _buildDropdownHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTitles.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: Image.asset(imagePaths[index], width: 24, height: 24),
                title: Text(filteredTitles[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> filteredTitles = [];
  List<String> titles = [
    'Inbound Logistics',
    'Employee Compliance Application',
    'HIRA system',
    'Injury Identification System',
    'Tag Redress System',
    'Kaizen System',
    'One Point Lesson',
    'Quality Alert System',
    'SOP System (SS & SC Function)',
    'SOP System (Project Engineering Department)',
  ];
  Widget _buildDropdownHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Applications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            _overlayEntry?.remove();
            isExpanded = false;
          },
          child: const Text(
            'View All',
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
