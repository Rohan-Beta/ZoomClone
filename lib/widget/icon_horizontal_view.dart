// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:zoom/constants/MyColor.dart';

class IconHorizontalView extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData MyIcon;
  final String MyText;

  const IconHorizontalView(
      {super.key,
      required this.onPressed,
      required this.MyIcon,
      required this.MyText});

  @override
  State<IconHorizontalView> createState() => _IconHorizontalViewState();
}

class _IconHorizontalViewState extends State<IconHorizontalView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Icon(
                widget.MyIcon,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Text(
            widget.MyText,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
