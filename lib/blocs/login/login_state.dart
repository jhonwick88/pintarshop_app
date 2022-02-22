part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final Email email;
  final Password password;

  const LoginState(
      {this.status = FormzStatus.pure,
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  // bool get isValidEmail => email.length > 3;
  // bool get isValidPassword => password.length == 8;

  LoginState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
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
