// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom/constants/MyColor.dart';

class ContactMeetingScreen extends StatefulWidget {
  const ContactMeetingScreen({super.key});

  @override
  State<ContactMeetingScreen> createState() => _ContactMeetingScreenState();
}

class _ContactMeetingScreenState extends State<ContactMeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text("Contacts"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
