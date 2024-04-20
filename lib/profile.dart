// ignore_for_file: no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';
import 'feed.dart';

class Profile extends StatefulWidget {
  final Map<String, dynamic> user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState(user: user);
}

class _ProfileState extends State<Profile> {
  _ProfileState({required this.user});
  Map<String, dynamic> user;

  void goToFeed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Feed(
          feedData: {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: const Color.fromARGB(255, 47, 108, 128)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                constraints: const BoxConstraints(
                    minHeight: 350,
                    minWidth: 250,
                    maxHeight: 700,
                    maxWidth: 500),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(232, 239, 231, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      constraints: BoxConstraints.tight(const Size(150, 150)),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(r'assets/pfp.png'),
                          radius: 150,
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                    ),
                  ],
                ),
              ),
            ),
            const History()
          ],
        )),
        backgroundColor: const Color.fromARGB(255, 47, 108, 128));
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(
            minHeight: 100, minWidth: 250, maxHeight: 700, maxWidth: 500),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(232, 239, 231, 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Posts",
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                ),
                Divider(),
                Text(
                  "Comments",
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                )
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
