import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cats_app/data/google_sign_in.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<GoogleSignInRequested>(_googleSignIn);
    on<SignOutRequested>(_signOut);
  }

  void _googleSignIn(
      GoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await authRepository.gooogleSignIn();
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  void _signOut(SignOutRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    await authRepository.signOut();
    emit(UnAuthenticated());
  }
}
