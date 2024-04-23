import 'package:app_frontend/utilities.dart';
import 'package:flutter/material.dart';

class Postpage extends StatefulWidget {
  const Postpage({super.key, required this.id});

  final String id;

  @override
  State<Postpage> createState() => _PostpageState(id: id);
}

class _PostpageState extends State<Postpage> {
  _PostpageState({required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadPost(id),
        builder: (builder, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                children: [
                  Text(snapshot.data!['postTitle']),
                  Text(snapshot.data!['postAuthor']),
                  Text(formatDate(snapshot.data!['postDate'])),
                  Text(snapshot.data!['postDescription']),
                ],
              ),
            ),
          );
        });
  }
}
