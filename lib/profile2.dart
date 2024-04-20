// ignore_for_file: no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';

class NewProfile extends StatefulWidget {
  final Map<String, dynamic> user;
  const NewProfile({super.key, required this.user});

  @override
  State<NewProfile> createState() => _NewProfileState(user: user);
}

class _NewProfileState extends State<NewProfile> {
  _NewProfileState({required this.user});
  Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: const Color.fromARGB(255, 47, 108, 128)),
        body: Stack(children: [
          const Image(image: AssetImage(r'assets/pfp.png')),
          ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topCenter,
                  // transform: GradientRotation(-3.14 / 2),
                  colors: [
                    Color.fromRGBO(232, 239, 231, 1),
                    Color.fromRGBO(232, 239, 231, 0)
                  ],
                )),
              )),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: Text("manage profile"),
              )
            ],
          )
        ]),
        backgroundColor: const Color.fromARGB(255, 47, 108, 128));
  }
}
