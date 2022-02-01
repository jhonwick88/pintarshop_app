import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final String email;
  final String password;

  const LoginState(
      {this.status = FormzStatus.pure, this.email = '', this.password = ''});

  LoginState copyWith({
    FormzStatus? status,
    String? email,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [status, email, password];
}
