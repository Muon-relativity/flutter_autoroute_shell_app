
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
    return SessionScope(
      session: _session,
      child: MaterialApp.router(
        routerConfig: _router.config(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

class SessionScope extends InheritedWidget {
  final Session session;

  const SessionScope({
    super.key,
    required this.session,
    required super.child,
  });

  static Session of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SessionScope>();
    if (scope == null) {
      throw Exception('No SessionScope found in context');
    }
    return scope.session;
  }

  @override
  bool updateShouldNotify(covariant SessionScope oldWidget) {
    return oldWidget.session != session;
  }
}