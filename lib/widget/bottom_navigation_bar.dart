// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zoom/constants/MyColor.dart';

class MyButtomNavigationBar extends StatefulWidget {
  const MyButtomNavigationBar({super.key});

  @override
  State<MyButtomNavigationBar> createState() => _MyButtomNavigationBarState();
}

class _MyButtomNavigationBarState extends State<MyButtomNavigationBar> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        onTap: onPageChanged,
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: "Meet & Char",
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
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: "Meet & Char",
          ),
        ],
      ),
    );
  }
}
