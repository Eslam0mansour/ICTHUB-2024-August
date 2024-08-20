import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_8/screens/login_screen.dart';

class AppAuthentication {
  static bool isLogin = false;
  static Future register(
      {required BuildContext context,required String mail, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // TODO SnackBar
    } catch (e) {
      print(e);
    }
  }

  //!================================================================
  static Future login(
      {required BuildContext context,
      required String mail,
      required String password}) async {
    try {
      // 'showSnackBar' is deprecated and shouldn't be used.
      //Use ScaffoldMessenger.showSnackBar.
      // Scaffold.of(context).showSnackBar(snackdemo);
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch (e) {
        // TODO SnackBar
      
    }
  }

  //!================================================================
  static Future signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
      (route) => false,
    );
  }

  static Future userChangeState(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        isLogin = false;
        print('User is currently signed out!');
      } else {
        isLogin = true;
        print('User is signed in!');
      }
    });
  }
}
