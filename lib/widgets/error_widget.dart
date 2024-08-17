import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function()? onTryAgain;

  const AppErrorWidget({
    super.key,
    required this.errorMessage,
    this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 20),
          if (onTryAgain != null)
            ElevatedButton(
              onPressed: onTryAgain,
              child: const Text('Try Again'),
            ),
        ],
      ),
    );
  }
}
