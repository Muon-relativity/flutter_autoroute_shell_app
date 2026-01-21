

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autoroute_shell_app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../router/app_router.dart';

@RoutePage()
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  static const _kOnboardingDone = 'onboarding_done';


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bootstrap();
    });
  }

  Future<void> _bootstrap() async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingDone = prefs.getBool(_kOnboardingDone) ?? false;

    // 라우터가 준비될 시간을 주기 위해 작은 지연을 둠
    await Future.delayed(Duration.zero);
    if (!mounted) return;

    if (!onboardingDone) {
      context.router.replaceAll([IntroductionRoute()]);
      prefs.setBool(_kOnboardingDone, true);
      return;
    }

    final session = SessionScope.of(context);
    final loggedIn = session.isAuthenticated;

    if (loggedIn) {
      context.router.replaceAll([const AppShellRoute()]);
    } else {
      context.router.replaceAll([
        LoginRoute(
          onLoginCallback: () {
            session.isAuthenticated = true;
          },
        )
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
