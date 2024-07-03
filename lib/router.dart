import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/pages/login_page.dart';
import 'features/auth/repository/auth_service.dart';
import 'features/home_screen/pages/home_page.dart';
import 'features/splash_screen/pages/splash_page.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute { splash, login, home }

final routerProvider = Provider<GoRouter>((ref) {

  final authState = ref.watch(authServiceProvider);

  return GoRouter(
    navigatorKey: _key,
    /// Forwards diagnostic messages to the dart:developer log() API.
    debugLogDiagnostics: true,
    /// Initial Routing Location
    initialLocation: '/',
    /// The listeners are typically used to notify clients that the object has been
    /// updated.
    refreshListenable: authState,

    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splash.name,
        builder: (context, state) {
          return SplashPage();
        },
      ),
      GoRoute(
        path: '/${AppRoute.home.name}',
        name: AppRoute.home.name,
        builder: (context, state) {
          return HomePage(userName: FirebaseAuth.instance.currentUser?.displayName,);
        },
      ),
      GoRoute(
        path: '/${AppRoute.login.name}',
        name: AppRoute.login.name,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
    ],
    redirect: (context, state) async {
      /**
       * Your Redirection Logic Code  Here..........
       */
      final isAuthenticated = await authState.isUserLoggedIn();
      /// [state.fullPath] will give current  route Path

      if (state.fullPath == '/${AppRoute.login.name}') {
        return isAuthenticated ? '/${AppRoute.home.name}' : '/${AppRoute.login.name}';
      }
      /// null redirects to Initial Location

      return isAuthenticated ? '/${AppRoute.home.name}' : '/${AppRoute.splash.name}';
    },
  );
});