// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'profile.dart';
import 'profile2.dart';
import 'utilities.dart';

class Feed extends StatefulWidget {
  final Map<String, dynamic> feedData;
  const Feed({super.key, required this.feedData});

  @override
  State<Feed> createState() => _FeedState(feedData: feedData);
}

class _FeedState extends State<Feed> {
  _FeedState({required this.feedData});
  Map<String, dynamic> feedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 47, 108, 128),
          actions: [
            IconButton(
              icon: const Icon(Icons.switch_account),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewProfile(user: {}),
                  ),
                );
              },
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 47, 108, 128),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const Post(postData: {});
            }));
  }
}
