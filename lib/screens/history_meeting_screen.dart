// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom/constants/MyColor.dart';
import 'package:zoom/provider/sign_in_provider.dart';

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
      body: SafeArea(
        child: StreamBuilder(
          stream: SignInProvider().meetigngHistory,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "Room Name: ${(snapshot.data! as dynamic).docs[index]["meetingName"]}"),
                  subtitle: Text(
                      "Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]["createdAt"].toDate())}"),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
