
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_autoroute_shell_app/app.dart';
import 'package:flutter_autoroute_shell_app/router/app_router.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings Page'),
      ),
      child: Center(
          child: CupertinoButton(child: const Text('Log out'), onPressed: () {
            final session = SessionScope.of(context);
            session.isAuthenticated = false;

            context.router.replaceAll([LoginRoute(
              onLoginCallback: () {
                session.isAuthenticated = true;
              },
            )]);
          })
      ),
    );
  }
}
