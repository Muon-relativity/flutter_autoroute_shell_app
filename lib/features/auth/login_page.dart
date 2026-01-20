
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autoroute_shell_app/router/app_router.dart';

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
          onPressed: (){
            onLoginCallback?.call();
            context.router.replaceAll([const AppShellRoute()]);
          },
          child: const Text('Login'),
        ),
      ),
    );
  }

}