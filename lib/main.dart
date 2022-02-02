import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintarshop_app/blocs/authentication/authentication_bloc.dart';
import 'package:pintarshop_app/repositories/auth_repository.dart';
import 'package:pintarshop_app/repositories/user_repository.dart';
import 'package:pintarshop_app/screens/my_home_page.dart';
import 'package:pintarshop_app/screens/splash_page.dart';

void main() {
  runApp(MyApp(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
          create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              userRepository: userRepository),
          child: AppView()),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   const ThemeMode _themeMode = ThemeMode.light;
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'POS PINTAR',
  //     themeMode: _themeMode,
  //     theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.red),
  //     darkTheme:
  //         ThemeData(primarySwatch: Colors.brown, primaryColor: Colors.green),
  //     home: const SplashPage(),
  //   );
  // }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil(
                      MyHomePage.route(), (route) => false);
                  break;
                case AuthenticationStatus.unauthenticated:
                  break;
                default:
                  break;
              }
            },
            child: child);
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
