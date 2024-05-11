import 'package:dishsapp/model/dish.dart';
import 'package:dishsapp/page/detail/detail_page.dart';
import 'package:dishsapp/page/dish/dish_page.dart';
import 'package:dishsapp/page/favourite/widget/favourite_page.dart';
import 'package:dishsapp/page/home/home_page.dart';
import 'package:dishsapp/page/login/login.dart';
import 'package:dishsapp/page/root_page.dart';
import 'package:dishsapp/page/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteCustom {
  static final GoRouter router =
      GoRouter(initialLocation: "/", routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) {
        return RootPage(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: "home",
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          name: "detail",
          path: '/detail',
          builder: (BuildContext context, GoRouterState state) {
            Dish item = state.extra as Dish;

            return DetailPage(item: item);
          },
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: DetailPage(item: state.extra as Dish),
              transitionDuration: const Duration(milliseconds: 200),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                // Change the opacity of the screen using a Curve based on the the animation's
                // value
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: "favourite",
          path: '/favourite',
          builder: (BuildContext context, GoRouterState state) {
            return const FavouritePage();
          },
        ),
        GoRoute(
          name: "dish",
          path: '/dish',
          builder: (BuildContext context, GoRouterState state) {
            return const DishPage();
          },
        ),
        GoRoute(
          name: "login",
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          name: "signup",
          path: '/signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpPage();
          },
        ),
      ],
    ),
  ]);
}
