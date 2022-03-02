import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pintarshop_app/models/user/user_model.dart';
import 'package:pintarshop_app/repositories/auth_repository.dart';
import 'package:pintarshop_app/repositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status
        .listen((status) => add(AuthenticationStatusChanged(status)));
  }
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  FutureOr<void> _onAuthenticationStatusChanged(
      AuthenticationStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        return emit(user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated());
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  // Future<UserTes?> _tryGetUser() async {
  //   try {
  //     final user = await _userRepository.getUser();
  //     return user;
  //   } catch (_) {
  //     return null;
  //   }
  // }
  Future<UserModel?> _tryGetUser() async {
    try {
      final user2 = await _userRepository.getUserModel();
      return user2;
    } catch (_) {
      return null;
    }
  }

  UserModel? _tryUser() {
    const user =
        UserModel(user: User(id: 1, username: "Paijo"), token: 'tokenuuu');
    return user;
  }
  // const user =
  //     UserModel(user: User(id: 1, username: "Paijo"), token: 'tokenuuu');
  // return user;
  // final user = await UserModel( user: User(id: 1, username: "Paijo"), token: "yes token"));

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
}
