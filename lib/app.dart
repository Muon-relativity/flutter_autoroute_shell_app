
import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'router/guards/auth_guard.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final Session _session = Session(false);
  late AppRouter _router;


  @override
  void initState() {
    super.initState();
    _router = AppRouter(authGuard: AuthGuard(_session));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
    );
  }
}