// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoom/constants/MyColor.dart';
import 'package:zoom/provider/sign_in_provider.dart';
import 'package:zoom/utills/screen_size.dart';
import 'package:zoom/widget/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RoundedLoadingButtonController signOutController =
      RoundedLoadingButtonController();
  int _page = 0;

  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MyScreenSize().getScreenSize();
    final sp = context.read<SignInProvider>();

    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          bottomNavigationBar: MyButtomNavigationBar(),
          // bottomNavigationBar: BottomNavigationBar(
          //   backgroundColor: footerColor,
          //   selectedItemColor: Colors.white,
          //   unselectedItemColor: Colors.grey[700],
          //   onTap: onPageChanged,
          //   currentIndex: _page,
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.comment_bank,
          //       ),
          //       label: "Meet & Char",
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.lock_clock,
          //       ),
          //       label: "Meetings",
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.person,
          //       ),
          //       label: "Contacts",
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.settings,
          //       ),
          //       label: "Settings",
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(
          //         Icons.comment_bank,
          //       ),
          //       label: "Meet & Char",
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
