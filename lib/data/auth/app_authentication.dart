import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_8/screens/login_screen.dart';

class AppAuthentication {
  static bool isLogin = false;

  static Future<bool> register({
    required BuildContext context,
    required String mail,
    required String name,
    required String phone,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: mail,
        password: password,
      )
          .then((v) {
        if (v.user != null) {
          saveNewUserToFireStore(
            name: name,
            mail: mail,
            phone: phone,
            password: password,
            uid: v.user!.uid,
          );
          return true;
        } else {
          return false;
        }
      });
      return credential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.red,
          content: Text(
            '${e.message}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  //!================================================================
  static Future<void> saveNewUserToFireStore({
    required String name,
    required String mail,
    required String phone,
    required String password,
    required String uid,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'mail': mail,
      'phone': phone,
      'password': password,
      'uid': uid,
    });
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
