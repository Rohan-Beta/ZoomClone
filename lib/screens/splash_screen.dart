// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom/provider/sign_in_provider.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/screens/login_screen.dart';
import 'package:zoom/utills/next_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();

    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreenReplace(context, const LogInScreen())
          : nextScreenReplace(context, const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage("MyAssets/splashimage.jpeg"),
            // image: NetworkImage(
            //     "https://miro.medium.com/v2/resize:fit:500/1*Q7TzUZZ9bOZO7rQsbc6IGg.png"),
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
