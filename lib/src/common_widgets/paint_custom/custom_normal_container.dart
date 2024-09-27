import 'package:flutter/material.dart';

class CustomNormalContainer extends StatelessWidget {
  final Widget child;

  CustomNormalContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.grey),
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}

const space1=SizedBox(height:15);