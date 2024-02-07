// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom/constants/MyColor.dart';
import 'package:zoom/provider/internet_provider.dart';
import 'package:zoom/provider/sign_in_provider.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD0O6bEgKf_JBl6iINWK_Uw38kROegu9qg",
          authDomain: "zoomclone-3e8d1.firebaseapp.com",
          projectId: "zoomclone-3e8d1",
          storageBucket: "zoomclone-3e8d1.appspot.com",
          messagingSenderId: "618127554627",
          appId: "1:618127554627:web:37babb34b73a6f860c3cf6",
          measurementId: "G-6W8V1TCDS9"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const ZoomClone());
}

class ZoomClone extends StatelessWidget {
  const ZoomClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => InternetProvider()),
      ],
      child: MaterialApp(
        title: "Zoom Clone",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: MySplashScreen(),
      ),
    );
  }
}
