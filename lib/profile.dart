// ignore_for_file: no_logic_in_create_state

import 'package:app_frontend/profileCreatorPage.dart';
import 'package:flutter/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'utilities.dart';
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
                Positioned(
                    top: 32,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 48,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileCreator(),
                          ),
                        );
                      },
                    )),
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
        History(data: info)
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
              color: Color.fromRGBO(181, 181, 181, 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const SizedBox(
            width: 115,
            height: 25,
            child: Center(child: Text("manage profile")),
          ),
        ),
      ),
    );
  }
}

class History extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  const History({super.key, required this.data});

  @override
  _HistoryState createState() => _HistoryState(data: data);
}

class _HistoryState extends State<History> {
  _HistoryState({required this.data});

  Map<dynamic, dynamic> data;
  final ValueNotifier<String> typeNotifier = ValueNotifier<String>('Posts');

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(padding: EdgeInsets.only(top: 8.0)),
              ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 2,
                minWidth: 290,
                animate: true,
                animationDuration: 125,
                curve: Curves.easeIn,
                labels: const ['Posts', 'Comments'],
                activeBgColor: [Color.fromRGBO(148, 158, 147, 1)],
                inactiveBgColor: Color.fromRGBO(232, 239, 231, 1),
                onToggle: (index) {
                  if (index == 0) {
                    typeNotifier.value = "Posts";
                    print(typeNotifier.value);
                  } else {
                    typeNotifier.value = "Comments";
                    print(typeNotifier.value);
                  }
                },
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Divider(color: Colors.black),
              // ),
              ValueListenableBuilder(
                valueListenable: typeNotifier,
                builder: (BuildContext context, String value, Widget? child) {
                  bool isPost =
                      value == "Posts"; // Define your boolean variable
                  return Column(
                    children: List<Widget>.generate(10, (int index) {
                      return isPost
                          ? const PostSmall(
                              title: "Bad Road Conditions",
                              description:
                                  "we will limit the post here to only the first 100 characters or so",
                            ) // Render PostSmall widget if isPost is true
                          : const CommentSmall(
                              comment:
                                  "Yeah the roads are not paved near my area as well",
                              postTitle: "Bad Road Conditions",
                            ); // Render CommentSmall widget if isPost is false
                    }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CommentSmall extends StatelessWidget {
  const CommentSmall(
      {super.key, required this.comment, required this.postTitle});

  final String comment;
  final String postTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: ListTile(
          title: Text(
            comment,
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Text(postTitle, style: const TextStyle(fontSize: 18)),
                ],
              ),
              const Divider(
                color: Colors.black,
              )
            ],
          ),
        ));
    ;
  }
}

class PostSmall extends StatelessWidget {
  const PostSmall({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          subtitle: Column(
            children: [
              Text(description, style: const TextStyle(fontSize: 16)),
              const Divider(
                color: Colors.black,
              )
            ],
          ),
        ));
  }
}
