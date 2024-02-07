// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom/constants/MyColor.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text("Seetings"),
          centerTitle: true,
        ),
        body: Container());
  }
}
