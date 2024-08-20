import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_8/data/auth/app_authentication.dart';
import 'package:new_8/screens/home_nav_bar.dart';
import 'package:new_8/screens/login_screen.dart';
import 'package:new_8/screens/register_screen.dart';

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    // AppAuthentication.userChangeState(context);
    
    print('AppAuthentication.isLogin ${AppAuthentication.isLogin}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: HomeNavBar(),
      home: FirebaseAuth.instance.currentUser!=null ? HomeNavBar() : LoginScreen(),
    );
  }
}
