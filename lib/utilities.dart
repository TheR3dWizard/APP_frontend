// ignore_for_file: must_be_immutable, avoid_print, no_logic_in_create_state

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class LabelledTextField extends StatelessWidget {
  final String label;
  TextEditingController? controller;
  bool? enabled;
  //final Function(String) subFunction;
  LabelledTextField({
    super.key,
    required this.label,
    //required this.subFunction
  });

  LabelledTextField.readable({
    super.key,
    required this.label,
    required this.controller,
  });

  LabelledTextField.offOn({
    super.key,
    required this.label,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxWidth: 450),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gapPadding: 5.0,
          ),
          labelText: label,
        ),
        controller: controller,
        enabled: enabled,
        //onSubmitted: subFunction,
      ),
    );
  }
}

class Bet extends StatefulWidget {
  final String name;
  final String pool;
  final String players;
  const Bet(
      {super.key,
      required this.name,
      required this.pool,
      required this.players});

  @override
  State<Bet> createState() =>
      _BetState(name: name, pool: pool, players: players);
}

class _BetState extends State<Bet> {
  String name;
  String pool;
  String players;

  _BetState({required this.name, required this.pool, required this.players});
  //TODO add on pressed function

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 2),
        child: Container(
          width: 100,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(100, 0, 0, 0),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 4.0), // shadow direction: bottom right
                ),
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 0.0),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(name),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(pool), Text(players)],
                ),
              )
            ],
          ),
        ));
  }
}

class Pill extends StatefulWidget {
  final String rightText;
  final String leftText;
  const Pill({super.key, required this.rightText, required this.leftText});

  @override
  State<Pill> createState() =>
      _PillState(rightText: rightText, leftText: leftText);
}

class _PillState extends State<Pill> {
  String rightText;
  String leftText;

  _PillState({required this.rightText, required this.leftText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 2),
        child: Container(
          width: 500,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(100, 0, 0, 0),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 4.0), // shadow direction: bottom right
                ),
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 0.0),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(leftText),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(rightText)),
            ],
          ),
        ));
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
                VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Text(
                  "Comments",
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(color: Colors.black),
            ),
            PostSmall()
          ],
        ),
      ),
    );
  }
}

class PostSmall extends StatelessWidget {
  const PostSmall(
      {super.key,
      this.title = "Bad Road Conditions",
      this.description =
          "we will limit the post here to only the first 200 or so characters and put these 4 dots, like reddit...."});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          Text(description, style: TextStyle(fontSize: 16)),
          const Divider(color: Colors.black),
        ],
      ),
    );
  }
}

// Custom Functions

//Function to load bet objects from json

Future<List<dynamic>> loadFeed() async {
  final dio = Dio();
  final res = await dio
      .get('https://activity-point-program-backend.onrender.com/api/posts');
  print("Response: ${res.data}");
  print("ResponseType: ${res.data.runtimeType}");
  return res.data;
}

Future<Map<dynamic, dynamic>> loadPost(String id) async {
  final dio = Dio();
  final res = await dio.get(
    'https://activity-point-program-backend.onrender.com/api/posts/$id',
  );
  return res.data;
}

String font() {
  return 'Poppins';
}

// local file functions

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localAccFile async {
  final path = await _localPath;

  File file = File('$path/account.json');
  if (!file.existsSync()) {
    await file.create(exclusive: false);
    String jsonString = await rootBundle.loadString('assets/account.json');
    await file.writeAsString(jsonString);
  }

  return file;
}

Future<Map> loadAccount() async {
  final File file = await _localAccFile;
  final String response = await file.readAsString();
  return json.decode(response);
}

void writeJsonToAccFile(Map<String, dynamic> data) async {
  final file = await _localAccFile;

  // Convert the data to a JSON string
  String jsonString = json.encode(data);

  // Write the JSON string to the file
  await file.writeAsString(jsonString);

  //print("File Data: ${await file.readAsString()}");
}
