import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_8/firebase_options.dart';
import 'package:new_8/new_app.dart';

/// new main function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NewApp());
}
