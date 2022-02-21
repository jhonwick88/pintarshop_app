import 'package:flutter/material.dart';
import 'package:pintarshop_app/my_app.dart';

import 'package:pintarshop_app/repositories/auth_repository.dart';
import 'package:pintarshop_app/repositories/user_repository.dart';

void main() {
  runApp(MyApp(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository()));
}
