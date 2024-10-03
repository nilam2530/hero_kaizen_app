import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RequestProvider with ChangeNotifier {
  String? _selectedActionStatus;
  DateTime? _selectedDate;
  String? _impactDescription;
  File? _uploadedFile;
  TextEditingController dateController;

  RequestProvider()
      : dateController = TextEditingController();

  String? get selectedActionStatus => _selectedActionStatus;
  DateTime? get selectedDate => _selectedDate;
  String? get impactDescription => _impactDescription;
  File? get uploadedFile => _uploadedFile;

  void updateActionStatus(String? status) {
    _selectedActionStatus = status;
    notifyListeners();
  }

  void updateTargetDate(DateTime? date) {
    _selectedDate = date;
    dateController.text = date != null
        ? DateFormat('dd MMM yyyy').format(date)
        : '';
    notifyListeners();
  }

  void updateImpactDescription(String? description) {
    _impactDescription = description;
    notifyListeners();
  }

  void updateUploadedFile(File? file) {
    _uploadedFile = file;
    notifyListeners();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
}
