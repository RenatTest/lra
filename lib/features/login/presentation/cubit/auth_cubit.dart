import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lra/core/storage/secure_storage/secure_storage.dart';
import 'package:lra/features/login/data/repository/user_repository.dart';
import 'package:lra/features/login/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository, required this.secureStorage})
    : super(AuthState());

  final UserRepository authRepository;
  final SecureStorage secureStorage;

  Future<void> logIn(
    String email,
    String password,
    String registrationType,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final user = await authRepository.logIn(
        email: email,
        password: password,
        registrationType: registrationType,
      );

      await secureStorage.saveToken(user.token);

      emit(state.copyWith(loading: false, user: user));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> register(
    String email,
    String password,
    String username,
    String registrationType,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final user = await authRepository.register(
        email: email,
        password: password,
        username: username,
        registrationType: registrationType,
      );

      await secureStorage.saveToken(user.token);

      emit(state.copyWith(loading: false, user: user));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> logOut() async {
    await secureStorage.deleteToken();
    emit(AuthState());
  }
}
