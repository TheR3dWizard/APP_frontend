// ignore_for_file: no_logic_in_create_state

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
    return FutureBuilder<Map<dynamic, dynamic>>(
        future: loadAccount(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data!.isNotEmpty) {
            return Scaffold(
              body: Stack(children: [
                Image(image: AssetImage(snapshot.data!['profilePicture'])),
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
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
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 20.0)),
                      const ManageProfile(),
                      const Padding(padding: EdgeInsets.only(top: 100.0)),
                      AccInfo(info: snapshot.data!),
                    ],
                  ),
                ),
              ]),
              backgroundColor: const Color.fromARGB(255, 47, 108, 128),
            );
          } else {
            return const Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator()));
          }
        });
  }
}

class AccInfo extends StatelessWidget {
  const AccInfo({super.key, this.info = const {}});

  final Map<dynamic, dynamic> info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          info['name'],
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const Padding(padding: EdgeInsets.only(top: 10.0)),
        Text(
          info['location'],
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          info['tag'] ?? "No Tag",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          info['dateOfBirth'],
          style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        const Padding(padding: EdgeInsets.only(top: 64.0)),
        const Row(
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            info['profileDescription'],
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const History()
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
