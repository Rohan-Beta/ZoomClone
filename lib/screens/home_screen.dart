// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoom/constants/MyColor.dart';
import 'package:zoom/screens/contact_meeting_screen.dart';
import 'package:zoom/screens/history_meeting_screen.dart';
import 'package:zoom/screens/meeting_screen.dart';
import 'package:zoom/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RoundedLoadingButtonController signOutController =
      RoundedLoadingButtonController();
  int _page = 0;

  // Future getData() async {
  //   final sp = context.read<SignInProvider>();
  //   sp.getDataFromSharedPreferences();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    Meeting(),
    HistoryMeetingScreen(),
    ContactMeetingScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final sp = context.read<SignInProvider>();

    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: pages[_page],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: footerColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[700],
            onTap: onPageChanged,
            currentIndex: _page,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.comment_bank,
                ),
                label: "Meet & Chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.lock_clock,
                ),
                label: "Meetings",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Contacts",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
