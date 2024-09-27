import 'package:flutter/material.dart';
import '../../common_widgets/custom_btn/view_button.dart';
import 'hazard_collection.dart';// Importing the HazardCorrectionDetail widget
import 'action_detail.dart'; // Importing the ActionDetail widget

class ViewRequestStatus extends StatelessWidget {
  Size? screen_size;
  @override
  Widget build(BuildContext context) {
    screen_size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('View Request'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height:(screen_size!.width<600)?550:350,
            child: HazardCorrectionDetail(),
          ),
          SizedBox(
          height:(screen_size!.width<600)?600:450, // adjust the height as needed
            child: ActionDetail(),
          ),
           SizedBox(
            height: 50, // adjust the height as needed
            child: ViewButton(),
          ),
        ],
      )
    );
  }
}