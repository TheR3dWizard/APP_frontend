// ignore_for_file: no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final Map<String, dynamic> user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState(user: user);
}

class _ProfileState extends State<Profile> {
  _ProfileState({required this.user});
  Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: const Color.fromARGB(255, 47, 108, 128)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(
                  minHeight: 500, minWidth: 250, maxHeight: 700, maxWidth: 500),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('pfp.png')),
                color: Color.fromRGBO(232, 239, 231, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                Text('12-05-2022',
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'Inter')),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('he/him',
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Inter')),
                              Text('Chennai, Tamil Nadu',
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Inter')),
                            ],
                          )
                        ],
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        "About",
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "This will just be some text about the person, we have to figure out what kinds of restrictions we’ll place on this or if we will place anything at all",
                      style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
        backgroundColor: const Color.fromARGB(255, 47, 108, 128));
  }
}
