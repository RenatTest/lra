import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lra/features/login/presentation/cubit/auth_cubit.dart';
import 'package:lra/features/login/presentation/cubit/auth_state.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page'), centerTitle: true),
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
                  onPressed: () => context.read<AuthCubit>().logOut(),
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
