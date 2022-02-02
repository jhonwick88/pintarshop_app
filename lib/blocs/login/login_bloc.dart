import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
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

  // @override
  // Stream<LoginState> onEvent(LoginEvent event) async* {
  //   super.onEvent(event);
  //   if (event is LoginEmailChanged) {
  //     yield state.copyWith(email: event.email);
  //   } else if (event is LoginPasswordChanged) {
  //     yield state.copyWith(password: event.password);
  //   } else if (event is LoginSubmitted) {
  //     yield state.copyWith(status: FormzStatus.submissionInProgress);
  //     try {
  //       await _authenticationRepository.logIn(
  //           email: state.email, password: state.password);
  //     } catch (_) {
  //       yield state.copyWith(status: FormzStatus.submissionFailure);
  //     }
  //   }
  // }

  void _onLoginEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    debugPrint("sini klik submit");
    debugPrint("email ${state.email}");
    debugPrint("password ${state.password}");
    // debugPrint("sini klik submit");

    // if (state.status.isValidated) {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    await _authenticationRepository.logIn(
        email: state.email, password: state.password);
    //}
  }
}
