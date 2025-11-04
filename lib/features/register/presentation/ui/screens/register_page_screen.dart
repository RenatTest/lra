import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lra/features/app/page_names.dart';

class RegisterPageScreen extends StatelessWidget {
  const RegisterPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register page'), centerTitle: true),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Register page'),
            ElevatedButton(
              onPressed: () => context.goNamed(PageNames.homePage),
              child: Text('Register'),
            ),
            GestureDetector(
              onTap: () => context.goNamed(PageNames.loginPage),
              child: Text(
                'Already have an account? Log in',
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
