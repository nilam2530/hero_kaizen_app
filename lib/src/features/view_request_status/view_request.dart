import 'package:flutter/material.dart';
import '../../common_widgets/custom_btn/view_button.dart';
import 'hazard_collection.dart';// Importing the HazardCorrectionDetail widget
import 'action_detail.dart'; // Importing the ActionDetail widget

class ViewRequestStatus extends StatelessWidget {
  const ViewRequestStatus({super.key});


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Request'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height:(screenSize.width<600)?550:350,
            child: const HazardCorrectionDetail(),
          ),
          SizedBox(
          height:(screenSize.width<600)?600:450, // adjust the height as needed
            child: const ActionDetail(),
          ),
           const SizedBox(
            height: 50, // adjust the height as needed
            child: ViewButton(),
          ),
        ],
      )
    );
  }
}