import 'package:flutter/material.dart';

class DashboardProvider1 extends ChangeNotifier {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int _selectedTabIndex = 0;
  DateTime? get selectedDate => _selectedDate;
  TimeOfDay? get selectedTime => _selectedTime;
  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }

  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }
}
