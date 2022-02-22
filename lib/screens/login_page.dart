import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pintarshop_app/animations/fade_animation.dart';
import 'package:pintarshop_app/blocs/authentication/authentication_bloc.dart';
import 'package:pintarshop_app/blocs/login/login_bloc.dart';
import 'package:pintarshop_app/repositories/auth_repository.dart';

// class LoginPage extends StatefulWidget {
//   //const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1.0),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: BlocProvider(
          create: (BuildContext context) {
            return LoginBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context));
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}

// class LoginCheck extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, state) {
//         if (state.status.isSubmissionFailure) {
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(const SnackBar(content: Text("Autentikasi gagal")));
//         }
//       },
//       child: const Text('Okeee'),
//     );
//   }
// }

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                const SnackBar(content: Text("Authentication Failure")));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FadeAnimation(
              1.2,
              Text("POS Pintar",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                      fontSize: 33,
                      fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 30,
          ),
          FadeAnimation(
              1.5,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    _EmailInput(),
                    _PasswordInput(),
                  ],
                ),
              )),
          const SizedBox(
            height: 40,
          ),
          FadeAnimation(1.8, _LoginButton()),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue[900],
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
                  elevation: 20,
                  minimumSize: const Size(300, 50),
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                child: const Text(
                  'LOGINX',
                  style: TextStyle(fontSize: 23),
                ));
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: TextFormField(
            // validator: (value) =>
            //     state.isValidPassword ? null : "Password Salah",
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                errorText: state.password.invalid ? 'Password Salah' : null,
                hintText: "Password"),
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: TextFormField(
            onChanged: (email) =>
                context.read<LoginBloc>().add(LoginEmailChanged(email)),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                errorText: state.email.invalid ? "Email not correct" : null,
                hintText: "Email"),
          ),
        );
      },
    );
  }
}
