import 'package:flutter/material.dart';
import 'utilities.dart';
import 'feed.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "YouComplain",
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  fontFamily: font()),
            )),
        Column(
          children: [
            LabelledTextField.readable(
              label: "Username",
              controller: usernameController,
            ),
            LabelledTextField.hidden(
              label: "Password",
              controller: passwordController,
            ),
          ],
        ),
        OutlinedButton(
          onPressed: () {
            authenticateUser(context, usernameController, passwordController);
          },
          style: OutlinedButton.styleFrom(
            shadowColor: Colors.black,
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          child: const Text('Login'),
        ),
      ],
    )));
  }

  void authenticateUser(BuildContext context, TextEditingController username,
      TextEditingController password) {
    //TODO authentication

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Feed()),
    );
  }
}
