
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autoroute_shell_app/app.dart';
import 'package:flutter_autoroute_shell_app/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SharedPreferences _preferences;


  @override
  void initState() {
    super.initState();
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () async {
                // context 사용 전 필요한 객체들을 미리 캡처 (async gap 안전)
                final messenger = ScaffoldMessenger.of(context);
                final router = context.router;

                final successSnack = const SnackBar(content: Text('Cache cleared successfully.'));
                final failSnack = const SnackBar(content: Text('Failed to clear cache.'));

                final result = await _preferences.clear();

                if (!mounted) return;
                messenger.showSnackBar(result ? successSnack : failSnack);
                router.replaceAll([IntroductionRoute()]);
              }, child: const Text('Clear Cache')),
              ElevatedButton(child: const Text('Log out'), onPressed: () {
                final session = SessionScope.of(context);
                session.isAuthenticated = false;

                context.router.replaceAll([LoginRoute(
                  onLoginCallback: () {
                    session.isAuthenticated = true;
                  },
                )]);
              }),
            ],
          )
      ),
    );
  }
}