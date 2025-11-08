import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lra/core/storage/prefs_storage/prefs_storage.dart';
import 'package:lra/di/di.dart';
import 'package:lra/features/login/presentation/cubit/auth_cubit.dart';
import 'package:lra/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsStorage.instance.init();
  initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
