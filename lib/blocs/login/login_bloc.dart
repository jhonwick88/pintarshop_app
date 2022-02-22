import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pintarshop_app/models/input/email.dart';
import 'package:pintarshop_app/models/input/password.dart';
import 'package:pintarshop_app/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }
  final AuthenticationRepository _authenticationRepository;

  void _onLoginEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
        email: email, status: Formz.validate([state.password, email])));
  }

  void _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: password, status: Formz.validate([password, state.email])));
  }

  FutureOr<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    debugPrint("sini klik submit");
    debugPrint("email ${state.email}");
    debugPrint("password ${state.password}");
    // debugPrint("sini klik submit");
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      // final client = ApiClient();
      // await client.postUserLogin(state.email, state.password);
      //await _authenticationRepository.getItems();
      final bool isSuccess = await _authenticationRepository.logIn(
          email: state.email.value, password: state.password.value);
      isSuccess
          ? emit(state.copyWith(status: FormzStatus.submissionSuccess))
          : emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
