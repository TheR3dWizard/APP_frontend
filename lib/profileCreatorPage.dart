import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'utilities.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCreator extends StatelessWidget {
  ProfileCreator({super.key});

  //       name,
  //       dob,
  //       aadharNumber,
  //       phoneNumber,
  //       userName,
  //       password,
  //       joinedOn,
  //       location,
  //       profilePicture,
  //       profileDescription,
  //       noOfPosts,
  //       postsOrComments,
  //       blockedUsers,
  //       profilePic,
  //       profilePicType

  TextEditingController nameController = TextEditingController();
  TextEditingController aadharNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  ValueNotifier<String> picPicked =
      ValueNotifier<String>("No Picture Selected");
  late File _imageFile;
  TextEditingController profileDescriptionController = TextEditingController();
  TextEditingController profilePicController = TextEditingController();
  TextEditingController profilePicTypeController = TextEditingController();

  ValueNotifier<DateTime?> dateOfBirth =
      ValueNotifier<DateTime?>(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 64)),
            LabelledTextField.readable(
              label: "Name",
              controller: nameController,
            ),
            GestureDetector(
              onTap: () async {
                dateOfBirth.value = await showDatePicker(
                  context: context,
                  initialDate: dateOfBirth.value,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
              },
              child: ValueListenableBuilder(
                  valueListenable: dateOfBirth,
                  builder: (context, value, child) {
                    return LabelledTextField.offOn(
                      label: formatDate(dateOfBirth.value.toString()),
                      enabled: false,
                    );
                  }),
            ),
            LabelledTextField.readable(
              label: "Aadhar Number",
              controller: aadharNumberController,
            ),
            LabelledTextField.readable(
              label: "Phone Number",
              controller: phoneNumberController,
            ),
            LabelledTextField.readable(
              label: "Username",
              controller: userNameController,
            ),
            LabelledTextField.hidden(
              label: "Password",
              controller: passwordController,
            ),
            LabelledTextField.readable(
              label: "Location",
              controller: locationController,
            ),
            GestureDetector(
              onTap: () async {
                final pickedImage =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  _imageFile = File(pickedImage.path);
                  picPicked.value = "Profile Picture Selected";
                }
              },
              child: ValueListenableBuilder(
                  valueListenable: picPicked,
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        LabelledTextField.offOn(
                          label: picPicked.value,
                          enabled: false,
                        ),
                        Visibility(
                            visible:
                                picPicked.value == "Profile Picture Selected",
                            child: OutlinedButton(
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: Image.file(_imageFile),
                                      );
                                    }),
                                child: Text("Show Image")))
                      ],
                    );
                  }),
            ),
            LabelledTextField.readable(
              label: "Profile Description",
              controller: profileDescriptionController,
            ),
            OutlinedButton(
              onPressed: () => createProfile(
                nameController.text,
                dateOfBirth.value!,
                aadharNumberController.text,
                phoneNumberController.text,
                userNameController.text,
                passwordController.text,
                "Put actual tag here",
                _imageFile,
                profileDescriptionController.text,
              ),
              child: Text("Create Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
