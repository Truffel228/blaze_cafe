import 'package:blaze_cafe/models/dish.dart';
import 'package:blaze_cafe/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static const String initial = '/initial';

  static const String onBoarding = '/onBoarding';

  static const String home = '/home';
  static const String homeOrder = 'homeOrder';

  static const String hotDeal = '/hotDeal';
  static const String hotDealOrder = 'hotDealOrder';

  static const String rewards = '/rewards';
  static const String yourRewards = 'yourRewards';

  static const String review = '/review';

  static const String qr = '/qr';

  static GoRouter get router => _router;

  static final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initial,
    routes: [
      GoRoute(
        path: initial,
        name: initial,
        builder: (context, state) => const InitialScreen(),
      ),
      GoRoute(
        path: onBoarding,
        name: onBoarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainScreen(child: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: home,
            routes: [
              GoRoute(
                path: home,
                name: home,
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    path: homeOrder,
                    name: homeOrder,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: OrderScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: hotDeal,
            routes: [
              GoRoute(
                path: hotDeal,
                name: hotDeal,
                builder: (context, state) => HotDealScreen(),
                routes: [
                  GoRoute(
                    path: hotDealOrder,
                    name: hotDealOrder,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: OrderScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: rewards,
            routes: [
              GoRoute(
                path: rewards,
                name: rewards,
                builder: (context, state) => const RewardsScreen(),
                routes: [
                  GoRoute(
                    path: yourRewards,
                    name: yourRewards,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: YourRewardsScreen(dish: state.extra as Dish?),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: review,
            routes: [
              GoRoute(
                path: review,
                name: review,
                builder: (context, state) => ReviewScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: qr,
        name: qr,
        builder: (context, state) => const QrScreen(),
      )
    ],
  );
}
