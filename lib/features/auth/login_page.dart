
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  final VoidCallback? onLoginCallback;

  const LoginPage({super.key, required this.onLoginCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onLoginCallback,
          child: const Text('Login'),
        ),
      ),
    );
  }

}