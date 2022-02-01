part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final String email;
  final String password;

  const LoginState(
      {this.status = FormzStatus.pure, this.email = '', this.password = ''});

  bool get isValidEmail => email.length > 3;
  bool get isValidPassword => password.length == 8;

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
