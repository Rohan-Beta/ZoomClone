// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoom/constants/MyColor.dart';
import 'package:zoom/provider/internet_provider.dart';
import 'package:zoom/provider/sign_in_provider.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/utills/next_screen.dart';
import 'package:zoom/utills/screen_size.dart';
import 'package:zoom/utills/snack_bar.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MyScreenSize().getScreenSize();

    return Scaffold(
      key: _scaffoldKey,
      body:
          // SingleChildScrollView(
          //   child:
          SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Start or join a metting",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.asset("MyAssets/onboarding.jpg"),
            SizedBox(height: 40),
            RoundedLoadingButton(
              controller: googleController,
              successColor: buttonColor,
              color: buttonColor,
              width: screenSize.width * 0.80,
              child: const Wrap(
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Sign in with google",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                handleGoogleSignIn();
              },
            ),
          ],
        ),
      ),
      // ),
    );
  }

  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackBar(context, "check your Internet Connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackBar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
        } else {
          // check whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists

              await sp.getUserDataFromFireStore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exists

              sp.saveDataToFireStore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handle after sign
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, const HomeScreen());
    });
  }
}
