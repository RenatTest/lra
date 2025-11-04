import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lra/features/app/page_names.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login page'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.goNamed(PageNames.homePage),
              child: Text('Login page'),
            ),
            GestureDetector(
              onTap: () => context.goNamed(PageNames.registerPage),
              child: Text(
                'Don\'t have an account? Register',
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
