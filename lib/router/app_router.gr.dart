// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppShellPage]
class AppShellRoute extends PageRouteInfo<void> {
  const AppShellRoute({List<PageRouteInfo>? children})
    : super(AppShellRoute.name, initialChildren: children);

  static const String name = 'AppShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppShellPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [HomeTabPage]
class HomeTabRoute extends PageRouteInfo<void> {
  const HomeTabRoute({List<PageRouteInfo>? children})
    : super(HomeTabRoute.name, initialChildren: children);

  static const String name = 'HomeTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeTabPage();
    },
  );
}

/// generated route for
/// [IntroductionPage]
class IntroductionRoute extends PageRouteInfo<void> {
  const IntroductionRoute({List<PageRouteInfo>? children})
    : super(IntroductionRoute.name, initialChildren: children);

  static const String name = 'IntroductionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IntroductionPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required VoidCallback? onLoginCallback,
    List<PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, onLoginCallback: onLoginCallback),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return LoginPage(key: args.key, onLoginCallback: args.onLoginCallback);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.onLoginCallback});

  final Key? key;

  final VoidCallback? onLoginCallback;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginCallback: $onLoginCallback}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key && onLoginCallback == other.onLoginCallback;
  }

  @override
  int get hashCode => key.hashCode ^ onLoginCallback.hashCode;
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchPage();
    },
  );
}

/// generated route for
/// [SearchTabPage]
class SearchTabRoute extends PageRouteInfo<void> {
  const SearchTabRoute({List<PageRouteInfo>? children})
    : super(SearchTabRoute.name, initialChildren: children);

  static const String name = 'SearchTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchTabPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [SettingsTabPage]
class SettingsTabRoute extends PageRouteInfo<void> {
  const SettingsTabRoute({List<PageRouteInfo>? children})
    : super(SettingsTabRoute.name, initialChildren: children);

  static const String name = 'SettingsTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsTabPage();
    },
  );
}

/// generated route for
/// [StartPage]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
    : super(StartRoute.name, initialChildren: children);

  static const String name = 'StartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartPage();
    },
  );
}
