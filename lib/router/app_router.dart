
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'guards/auth_guard.dart';

// pages
import '../features/home/home_page.dart';
import '../features/auth/login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter({required this.authGuard});

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, guards: [authGuard]),
        AutoRoute(page: LoginRoute.page),
      ];
}