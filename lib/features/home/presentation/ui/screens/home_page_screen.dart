import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lra/features/app/page_names.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Home page'),
            ElevatedButton(
              onPressed: () => context.goNamed(PageNames.loginPage),
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
