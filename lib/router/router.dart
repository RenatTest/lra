import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lra/router/page_names.dart';
import 'package:lra/features/home/presentation/ui/screens/home_page_screen.dart';
import 'package:lra/features/login/presentation/cubit/auth_cubit.dart';
import 'package:lra/features/login/presentation/ui/screens/login_page_screen.dart';
import 'package:lra/features/register/presentation/ui/screens/register_page_screen.dart';

final router = GoRouter(
  redirect: _checkAuthRedirect,
  routes: [
    GoRoute(
      path: '/',
      name: PageNames.loginPage,
      builder: (context, state) => const LoginPageScreen(),
      routes: [
        GoRoute(
          path: 'register-page',
          name: PageNames.registerPage,
          builder: (context, state) => const RegisterPageScreen(),
        ),
        GoRoute(
          path: 'home-page',
          name: PageNames.homePage,
          builder: (context, state) => const HomePageScreen(),
        ),
      ],
    ),
  ],
);

String? _checkAuthRedirect(BuildContext context, GoRouterState state) {
  final currentUser = context.read<AuthCubit>().state.user;
  final currentPath = state.matchedLocation;

  final isLoginFlow = ['/', '/register-page'].contains(currentPath);

  if (isLoginFlow) return currentUser != null ? '/home-page' : null;

  if (currentUser == null) return '/';

  return null;
}
