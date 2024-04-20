// ignore_for_file: no_logic_in_create_state

import 'dart:convert';
import 'package:flutter/widgets.dart';

import 'utilities.dart';
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
        // appBar: AppBar(backgroundColor: const Color.fromRGBO(232, 239, 231, 1)),
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
          const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                ManageProfile(),
                Padding(padding: const EdgeInsets.only(top: 100.0)),
                AccInfo()
              ],
            ),
          )
        ]),
        backgroundColor: const Color.fromARGB(255, 47, 108, 128));
  }
}

class AccInfo extends StatelessWidget {
  const AccInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Dhakkshin S R",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        Text(
          "Coimbatore, Tamil Nadu",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "Narcotics Control Bureau",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "13-05-1977",
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        Padding(padding: EdgeInsets.only(top: 64.0)),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "About",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "This will just be some text about the person, we have to figure out what kinds of restrictions we’ll place on this or if we will place anything at all",
            style: TextStyle(fontSize: 18),
          ),
        ),
        History()
      ],
    );
  }
}

class ManageProfile extends StatelessWidget {
  const ManageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(232, 239, 231, 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const SizedBox(
            width: 125,
            height: 25,
            child: Center(child: Text("manage profile")),
          ),
        ),
      ),
    );
  }
}
