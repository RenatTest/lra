import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lra/features/app/page_names.dart';
import 'package:lra/features/login/presentation/cubit/auth_cubit.dart';
import 'package:lra/features/login/presentation/cubit/auth_state.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Center(
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome user #${state.user?.id ?? ''}'),
                ElevatedButton(
                  onPressed: () async {
                    await context.read<AuthCubit>().logOut();
                    // ignore: use_build_context_synchronously
                    context.goNamed(PageNames.loginPage);
                  },

                  child: Text('Log out'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
