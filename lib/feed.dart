// ignore_for_file: no_logic_in_create_state
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'profile2.dart';
import 'utilities.dart';
import 'postPage.dart';

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
        body: FutureBuilder<List<dynamic>>(
            future: loadFeed(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // print("Data received is ${snapshot.data}");
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Postpage(id: snapshot.data![index]['_id']),
                            ),
                          );
                        },
                        child: Post(postData: snapshot.data![index]),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}

class Post extends StatefulWidget {
  final Map<dynamic, dynamic> postData;

  const Post({super.key, required this.postData});

  @override
  State<Post> createState() => _PostState(postData: postData);
}

class _PostState extends State<Post> {
  _PostState({required this.postData});
  Map<dynamic, dynamic> postData;

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
            Text(
              postData['postTitle'],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 30,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    postData['postAuthor'],
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(78, 101, 108, 1.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    postData['location'].toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(78, 101, 108, 1.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormat('dd-MM-yyyy')
                        .format(DateTime.parse(postData['postDate'])),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(78, 101, 108, 1.0),
                        fontFamily: 'Inter'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    postData['postDescription'],
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
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
