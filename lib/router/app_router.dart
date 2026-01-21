import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'guards/auth_guard.dart';

// pages
import '../features/home/home_page.dart';
import '../features/home/home_tab_page.dart';
import '../features/auth/login_page.dart';
import '../features/search/search_page.dart';
import '../features/search/search_tab_page.dart';
import '../features/settings/settings_page.dart';
import '../features/settings/settings_tab_page.dart';
import '../features/shell/app_shell_page.dart';
import '../features/start/start_page.dart';
import '../features/onboarding/introduction_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter({required this.authGuard});

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: StartRoute.page, initial: true),

    AutoRoute(
      page: AppShellRoute.page,
      guards: [authGuard],
      children: [
        AutoRoute(
          page: HomeTabRoute.page,
          children: [AutoRoute(page: HomeRoute.page, initial: true)],
        ),
        AutoRoute(
          page: SearchTabRoute.page,
          children: [AutoRoute(page: SearchRoute.page, initial: true)],
        ),
        AutoRoute(
          page: SettingsTabRoute.page,
          children: [AutoRoute(page: SettingsRoute.page, initial: true)],
        ),
      ],
    ),
    AutoRoute(page: IntroductionRoute.page),
    AutoRoute(page: LoginRoute.page),
  ];
}
