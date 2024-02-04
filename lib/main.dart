// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          appId: "1:618127554627:web:300a1e2749436d710c3cf6",
          measurementId: "G-P0X36F31VJ"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider(create: (context) => SignInProvider()),
        //     ChangeNotifierProvider(create: (context) => InternetProvider()),
        //   ],
        // child:
        MaterialApp(
      title: "Amazon Clone",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("hello world"),
          ),
        ),
      ),
    );
    // );
  }
}
