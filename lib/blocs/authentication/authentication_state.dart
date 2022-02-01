part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState._({this.status = AuthenticationStatus.unknown});
  final AuthenticationStatus status;
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}
