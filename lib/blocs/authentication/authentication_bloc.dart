import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      : super(const AuthenticationState.unknown()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
