import 'package:auto_route/auto_route.dart';

import '../app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final Session _session;

  AuthGuard(this._session);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_session.isAuthenticated) {
      resolver.next(true);
      return;
    }

    router.push(
      LoginRoute(
        onLoginCallback: () {
          _session.isAuthenticated = true;
          resolver.next(true);
          router.removeLast();
        },
      ),
    );
  }
}

class Session {
  bool isAuthenticated;
  Session(this.isAuthenticated);
}
