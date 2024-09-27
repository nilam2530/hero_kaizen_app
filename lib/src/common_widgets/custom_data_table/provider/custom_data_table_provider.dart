import 'package:flutter/material.dart';

class CustomDataTableProvider extends ChangeNotifier {
  final Set<int> _expandedRows = <int>{};
  int _currentPage = 0;

  int get currentPage => _currentPage;
  Set<int> get expandedRows => _expandedRows;

  void toggleRowExpansion(int index) {
    if (_expandedRows.contains(index)) {
      _expandedRows.remove(index);
    } else {
      _expandedRows.add(index);
    }
    notifyListeners();
  }

  void goToNextPage(int totalPages) {
    if (_currentPage < totalPages - 1) {
      _currentPage++;
      notifyListeners();
    }
  }

  void goToPreviousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
    }
  }
}
