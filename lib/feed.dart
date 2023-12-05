// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

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
        appBar:
            AppBar(backgroundColor: const Color.fromARGB(255, 47, 108, 128)),
        backgroundColor: const Color.fromARGB(255, 47, 108, 128),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const Post(postData: {});
            }));
  }
}

class Post extends StatefulWidget {
  final Map<String, dynamic> postData;

  const Post({super.key, required this.postData});

  @override
  State<Post> createState() => _PostState(postData: postData);
}

class _PostState extends State<Post> {
  _PostState({required this.postData});
  Map<String, dynamic> postData;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        constraints:
            const BoxConstraints(maxHeight: 350, maxWidth: 500, minHeight: 300),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Bad Road Conditions",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 30,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "John Doe",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Color.fromRGBO(78, 101, 108, 1.0)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Anna Nagar",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Color.fromRGBO(78, 101, 108, 1.0)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "03-12-23",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(78, 101, 108, 1.0),
                        fontFamily: 'Inter'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "we will limit the post here to only the first 200 or so characters and put these 4 dots, like reddit....",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20, fontFamily: 'Inter', height: 1.2),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_down),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
