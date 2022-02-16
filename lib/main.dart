import 'package:dira_00/Drawer/about.dart';
import 'package:dira_00/Drawer/help.dart';
import 'package:dira_00/Drawer/helpline.dart';
import 'package:dira_00/Drawer/settings.dart';
import 'package:dira_00/Pages/chatScreen.dart';
import 'package:dira_00/Pages/chatpage.dart';
import 'package:dira_00/Pages/description.dart';
import 'package:flutter/material.dart';
import 'package:dira_00/login.dart';
import 'package:dira_00/Pages/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'otp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/sign_in": (context) => login(),
        "/otp": (context) => otp(),
        "/homepage":(context) =>HomePage(),
        "/chatpage":(context) => chatpage(),
        "/chatScreen":(context) =>chatScreen(),
        "/help":(context)=>help(),
        "/about":(context)=>about(),
        "/settings":(context)=>settings(),
        "/helpline":(context)=>helpline(),
        "/description":(context)=>description(),
      },
      initialRoute: "/sign_in",

    );
  }
}

