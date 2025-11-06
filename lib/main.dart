import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lra/core/network/user_api/retrofit/user_api_retrofit.dart';
import 'package:lra/features/login/data/data_source/user_data_source.dart';
import 'package:lra/features/login/data/repository/user_repository.dart';
import 'package:lra/features/login/presentation/cubit/auth_cubit.dart';
import 'package:lra/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(
        authRepository: UserRepositoryImpl(
          dataSource: UserDataSourceImpl(UserApiRetrofit(Dio())),
        ),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
