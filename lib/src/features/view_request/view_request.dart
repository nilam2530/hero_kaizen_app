import 'package:flutter/material.dart';
import 'package:hero_kaizen_app/src/features/view_request/view_request_screen.dart';

class ViewRequestScreen extends StatefulWidget {
  const ViewRequestScreen({super.key});

  @override
  State<ViewRequestScreen> createState() => _ViewRequestScreenState();
}

class _ViewRequestScreenState extends State<ViewRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return const ViewRequestPage();
  }
}
