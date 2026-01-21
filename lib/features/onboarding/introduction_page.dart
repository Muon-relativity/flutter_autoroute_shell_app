
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autoroute_shell_app/router/app_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

@RoutePage()
class IntroductionPage extends StatelessWidget {
const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to the App",
          body: "This is an introduction to the app's features.",
          image: Image.asset('assets/images/intro1.png', width: 250, height: 250),
        ),
        PageViewModel(
          title: "Feature 1",
          body: "Description of Feature 1.",
          image: Image.asset('assets/images/intro2.png', width: 250, height: 250),
        ),
        PageViewModel(
          title: "Feature 2",
          body: "Description of Feature 2.",
          image: Image.asset('assets/images/intro3.png', width: 250, height: 250),
        ),
        PageViewModel(
          title: "Get Started",
          body: "Let's get started using the app!",
          image: Image.asset('assets/images/intro4.png', width: 250, height: 250),
        )
      ],
      onDone: () {
        context.router.replaceAll([const AppShellRoute()]);
      },
      onSkip: () {
        context.router.replaceAll([const AppShellRoute()]);
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
