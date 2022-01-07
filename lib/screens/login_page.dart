import 'package:flutter/material.dart';
import 'package:pintarshop_app/animations/fade_animation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1.0),
      body: Container(
        padding: const EdgeInsets.all(30.0),
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
                      Container(
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8)),
                              hintText: "Email"),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8)),
                              hintText: "Password"),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            FadeAnimation(
                1.8,
                TextButton(
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
                    onPressed: () {},
                    child: const Text('Login'))),
          ],
        ),
      ),
    );
  }
}
