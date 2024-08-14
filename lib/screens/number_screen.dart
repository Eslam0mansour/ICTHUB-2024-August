import 'package:flutter/material.dart';

class NumberScreen extends StatelessWidget {
  final String path;

  const NumberScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.login),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Image.asset(path),
      ),
    );
  }
}
