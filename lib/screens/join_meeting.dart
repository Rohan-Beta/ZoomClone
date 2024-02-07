// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:zoom/constants/MyColor.dart';
import 'package:zoom/provider/sign_in_provider.dart';
import 'package:zoom/widget/jitsi_meet_widget.dart';
import 'package:zoom/widget/meeting_option_widget.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  TextEditingController uidTextController = TextEditingController();

  TextEditingController nameController =
      TextEditingController(text: SignInProvider().name);

  final JitsiProvider _jitsiProvider = JitsiProvider();

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  // Future getData() async {
  //   final sp = context.read<SignInProvider>();
  //   sp.getDataFromSharedPreferences();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   uidTextController.dispose();
  // }

  _joinMeeting() {
    _jitsiProvider.createMeeting(
      roomName: uidTextController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      // userName: nameController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    // final sp = context.read<SignInProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          "Join Metting",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: uidTextController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Room ID",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
              child: const Text(
                "Join",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onPressed: _joinMeeting,
            ),
            SizedBox(
              height: 20,
            ),
            MeetingOptionWidget(
              myText: "Turn off My Mic",
              isMute: isAudioMuted,
              onChange: onAudioMuted,
            ),
            SizedBox(
              height: 10,
            ),
            MeetingOptionWidget(
              myText: "Turn off My Video",
              isMute: isVideoMuted,
              onChange: onVideoMuted,
            ),
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }

  onVideoMuted(bool? val) {
    setState(() {
      isVideoMuted = val!;
    });
  }
}
