import 'package:flutter/material.dart';

class TabControllerProviderDashboard extends ChangeNotifier {
  late TabController tabController;

  TabControllerProviderDashboard({required TickerProvider vsync, required int length}) {
    tabController = TabController(length: length, vsync: vsync);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
