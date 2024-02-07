// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom/constants/MyColor.dart';

class HistoryMeetingScreen extends StatefulWidget {
  const HistoryMeetingScreen({super.key});

  @override
  State<HistoryMeetingScreen> createState() => _HistoryMeetingScreenState();
}

class _HistoryMeetingScreenState extends State<HistoryMeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text("Meeting History"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
