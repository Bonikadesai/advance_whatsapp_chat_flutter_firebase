import 'dart:io';

import 'package:chat_app_flutter_app/Views/Screens/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Helpers/firebase_auth_helper.dart';
import '../Components/Chat/chat_home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User? data = ModalRoute.of(context)!.settings.arguments as User?;
    final ImagePicker picker = ImagePicker();
    File? xfile;
    File? imgFile;
    int menu = 1;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chat App",
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Icon(
                    color: Colors.white,
                    Icons.people_outline_outlined,
                  ),
                ),
                Tab(
                  child: Text(
                    "Chats",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Calls",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
          actions: [
            IconButton(
              onPressed: () async {
                ImagePicker picker = ImagePicker();
                XFile? xfile =
                    await picker.pickImage(source: ImageSource.camera);
                String path = xfile!.path;
                setState(() {
                  imgFile = File(path);
                });
                Navigator.of(context).pop();
              },
              icon: const Icon(
                color: Colors.white,
                Icons.camera_alt_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                color: Colors.white,
                Icons.search,
              ),
            ),
            PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text(
                    "New group",
                  ),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text(
                    "New broadcast",
                  ),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text(
                    "Linked devices",
                  ),
                ),
                const PopupMenuItem(
                  value: 4,
                  child: Text(
                    "Notification",
                  ),
                ),
                const PopupMenuItem(
                  value: 5,
                  child: Text(
                    "Settings",
                  ),
                ),
                const PopupMenuItem(
                  value: 6,
                  child: Text(
                    "Logout",
                  ),
                ),
              ],
              onSelected: (more) {
                setState(() {
                  more = more;
                });
                if (more == 6) {
                  Auth_Helper.auth_helper.SignOut();
                  Navigator.pushReplacementNamed(context, "/");
                  AlertDialog(
                    title: const Text("Are You Sure.."),
                    content: const Text("Do you Want to Exit..."),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Auth_Helper.auth_helper.SignOut();
                            Navigator.pushReplacementNamed(context, "/");
                          },
                          child: const Text("Yes")),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("No"),
                      ),
                    ],
                  );
                }
                if (more == 4) {
                  Get.toNamed('/notification');
                }
              },
            ),
          ],
          backgroundColor:
              (Get.isDarkMode) ? Colors.black : Colors.teal.shade700,
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Introducing communities",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    textAlign: TextAlign.center,
                    "Easily organise your related groups and send announcements."
                    "Now, your communities, like neightbourhoods or schools, can have their"
                    "own space."),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.teal.shade700)),
                  onPressed: () {},
                  child: const Text(
                    "Start your community",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            //chats

            const Chat_Home_Screen(),

            //call
            const Center(
              child: Text("No any Calls"),
            ),
            //settings
            const SettingPage(),
          ],
        ),
      ),
    );
  }
}
