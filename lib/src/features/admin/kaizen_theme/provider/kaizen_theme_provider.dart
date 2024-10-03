import 'package:flutter/material.dart';
import '../../../../models/kaizen_theme_model.dart';
import '../../../../models/pillar_model.dart';

class KaizenThemeProvider with ChangeNotifier {
  static const int _rowsPerPage = 10;
  int _currentPage = 0;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sortOrderController = TextEditingController();
  String selectetThemeStatus = '';
  List<KaizenThemeTableModel> newData = List.generate(
    50,
    (index) => KaizenThemeTableModel(
      id: (index + 1).toString(),
      name: "Plant ${index + 1}",
      sortNo: (index + 1).toString(),
      status: index % 2 == 0 ? "Pending" : "Completed",
      action: "Action ${index + 1}",
    ),
  );

  List<KaizenThemeTableModel> get paginatedData {
    final start = _currentPage * _rowsPerPage;
    final end = start + _rowsPerPage;
    return newData.sublist(start, end.clamp(0, newData.length));
  }

  List<PillarModel> pillarModel = [
    PillarModel(title: 'Head 1'),
    PillarModel(title: 'Head 2'),
  ];

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  int get totalPages => (newData.length / _rowsPerPage).ceil();

  void addNewTheme({
    required String name,
    required String sortOrder,
    required String status,
  }) {
    final newPillar = KaizenThemeTableModel(
      id: (newData.length + 1).toString(),
      name: name,
      sortNo: sortOrder,
      status: status,
      action: "Action ${newData.length + 1}",
    );

    newData.add(newPillar);

    nameController.clear();

    sortOrderController.clear();
    selectetThemeStatus = '';
    notifyListeners();
  }

  void setSelectedPillarHead(String value) {
    selectetThemeStatus = value;
    notifyListeners();
  }
}
