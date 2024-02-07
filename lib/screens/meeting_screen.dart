// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom/constants/MyColor.dart';
import 'package:zoom/provider/sign_in_provider.dart';
import 'package:zoom/screens/join_meeting.dart';
import 'package:zoom/utills/next_screen.dart';
import 'package:zoom/utills/screen_size.dart';
import 'package:zoom/widget/icon_horizontal_view.dart';
import 'package:zoom/widget/jitsi_meet_widget.dart';

class Meeting extends StatelessWidget {
  Meeting({
    super.key,
  });

  final JitsiProvider _jitsiProvider = JitsiProvider();

  createNewMeeting() async {
    _jitsiProvider.createMeeting(
      roomName: MyScreenSize().getUid(),
      isAudioMuted: true,
      isVideoMuted: true,
      username: SignInProvider().name.toString(),
      email: SignInProvider().email.toString(),
      image: SignInProvider().imageUrl.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text("Meet & Chat"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconHorizontalView(
                onPressed: createNewMeeting,
                MyIcon: Icons.videocam,
                MyText: "New Metting",
              ),
              IconHorizontalView(
                onPressed: () {
                  nextScreen(context, JoinMeeting());
                },
                MyIcon: Icons.add_box_rounded,
                MyText: "Join Meeting",
              ),
              IconHorizontalView(
                onPressed: () {},
                MyIcon: Icons.calendar_month_outlined,
                MyText: "Schedule",
              ),
              IconHorizontalView(
                onPressed: () {},
                MyIcon: Icons.arrow_upward_rounded,
                MyText: "Share Screen",
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                "Create/Join Meeting with just a click!",
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
