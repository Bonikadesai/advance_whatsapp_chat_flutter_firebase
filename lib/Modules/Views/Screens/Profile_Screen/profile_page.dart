import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  String name = "";
  String phone = "";
  String about = "";
  File? imgFile;
  final ImagePicker picker = ImagePicker();
  File? xfile;
  File? yfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey.shade300,
                foregroundImage:
                    (imgFile != null) ? FileImage(imgFile as File) : null,
                child: const Text(
                  "ADD",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.teal.shade700,
                mini: true,
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                onPressed: () async {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text("Pick the Camera"),
                              onTap: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? xfile = await picker.pickImage(
                                    source: ImageSource.camera);
                                String path = xfile!.path;
                                setState(() {
                                  imgFile = File(path);
                                });
                                Get.back();
                              },
                            ),
                            ListTile(
                              title: const Text("Pick the Gallery"),
                              onTap: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? xfile = await picker.pickImage(
                                    source: ImageSource.gallery);
                                String path = xfile!.path;
                                setState(() {
                                  imgFile = File(path);
                                });
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
            child: TextFormField(
              controller: namecontroller,
              textInputAction: TextInputAction.next,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter the Name";
                }
                return null;
              },
              onSaved: (val) {
                name = val!;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Full Name ",
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
            child: TextFormField(
              controller: aboutcontroller,
              textInputAction: TextInputAction.done,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter the about";
                }
                return null;
              },
              onSaved: (val) {
                about = val!;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "About ",
                prefixIcon: Icon(
                  Icons.chat,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
            child: TextFormField(
              controller: phonecontroller,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter the Phone number";
                }
                return null;
              },
              onSaved: (val) {
                phone = val!;
              },
              maxLength: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Phone Number ",
                prefixIcon: Icon(
                  Icons.call,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
