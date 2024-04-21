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
    return Scaffold();
  }
}
