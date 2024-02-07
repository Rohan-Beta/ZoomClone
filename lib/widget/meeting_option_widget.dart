// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom/constants/MyColor.dart';

class MeetingOptionWidget extends StatefulWidget {
  final String myText;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOptionWidget(
      {super.key,
      required this.myText,
      required this.isMute,
      required this.onChange});

  @override
  State<MeetingOptionWidget> createState() => _MeetingOptionWidgetState();
}

class _MeetingOptionWidgetState extends State<MeetingOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              widget.myText,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch.adaptive(
            activeColor: buttonColor,
            value: widget.isMute,
            onChanged: widget.onChange,
          ),
        ],
      ),
    );
  }
}
