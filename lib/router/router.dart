import 'package:go_router/go_router.dart';
import 'package:lra/core/storage/secure_storage/secure_storage.dart';
import 'package:lra/features/app/page_names.dart';
import 'package:lra/features/home/presentation/ui/screens/home_page_screen.dart';
import 'package:lra/features/login/presentation/ui/screens/login_page_screen.dart';
import 'package:lra/features/register/presentation/ui/screens/register_page_screen.dart';

final router = GoRouter(
  redirect: (context, state) async {
    final token = await SecureStorage.instance.getToken();

    if (token == '' && state.matchedLocation != '/') {
      return '/';
    }

    if (token != '' && state.matchedLocation == '/') {
      return '/home-page';
    }

    return null;
  },
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
          path: '/home-page',
          name: PageNames.homePage,
          builder: (context, state) => const HomePageScreen(),
        ),
      ],
    ),
  ],
);
