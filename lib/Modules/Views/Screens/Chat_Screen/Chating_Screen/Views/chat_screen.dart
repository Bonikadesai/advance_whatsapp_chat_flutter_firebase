import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../../../../../Globals/globals.dart';
import '../../../../../utils/utils.dart';
import '../../../Login_SignUP_Screen/Auth_Helper/firebase_auth_helper.dart';
import '../../../Notification_Screen/Helper/Notification_Helper/notification_helper.dart';
import '../Cloud_Firestore_Helper/firebase_cloud_firestore_helper.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> data =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${data[2].split("@")[0]}",
          style: TextStyle(color: Colors.white),
        ),
        //centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: (Get.isDarkMode) ? Colors.black : Colors.teal.shade700,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "home");
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.video_camera_solid,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              color: Colors.white,
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
                  "View contact",
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text(
                  "Serch",
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text(
                  "Mute notifications",
                ),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text(
                  "Wallpaper",
                ),
              ),
              const PopupMenuItem(
                value: 5,
                child: Text(
                  "Report",
                ),
              ),
              const PopupMenuItem(
                value: 6,
                child: Text(
                  "Block",
                ),
              ),
              const PopupMenuItem(
                value: 7,
                child: Text(
                  "Clear chat",
                ),
              ),
            ],
            onSelected: (more) {
              // setState(() {
              //   more = more;
              // });
              if (more == 6) {
                // Drawer(
                //   width: 300,
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 50,
                //       ),
                //       CircleAvatar(
                //         radius: 80,
                //         foregroundImage: NetworkImage("${data?.photoURL}"),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Text("${data?.displayName}"),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Divider(),
                //       Text("${data?.email}"),
                //       Divider(),
                //     ],
                //   ),
                // );
              }
            },
          ),
        ],
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (Get.isDarkMode)
                ? const AssetImage(
                    "assets/image/dark_bg.png",
                  )
                : const AssetImage(
                    "assets/image/background.jpeg",
                  ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: StreamBuilder(
                  stream: all_stream_messages,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      QuerySnapshot<Map<String, dynamic>>? snapshot_data =
                          snapshot.data;
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>? data =
                          snapshot_data?.docs;

                      return (data!.isEmpty)
                          ? const Center(
                              child: Text("No Message Yet"),
                            )
                          : ListView.builder(
                              reverse: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    FireStore_Helper.fireStore_Helper
                                        .DeleteChat(
                                            uid: data[index].id,
                                            uid1: data[index]['sentby'],
                                            uid2: data[index]['receivedby']);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: (data[index]
                                                  ['sentby'] ==
                                              Auth_Helper
                                                  .auth_helper
                                                  .firebaseAuth
                                                  .currentUser
                                                  ?.uid)
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Center(
                                              child: Text(data[index]
                                                  .data()['timestamp']
                                                  .toDate()
                                                  .toString()
                                                  .split(" ")[0]),
                                            ),
                                            Chip(
                                              label: Row(
                                                crossAxisAlignment: (data[index]
                                                            ['msg'] ==
                                                        Auth_Helper
                                                            .auth_helper
                                                            .firebaseAuth
                                                            .currentUser
                                                            ?.uid)
                                                    ? CrossAxisAlignment.start
                                                    : CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${data[index]['msg']}",
                                                    style: TextStyle(
                                                      color: (Get.isDarkMode)
                                                          ? Colors.black
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "${data[index]['timestamp'].toDate().toString().split(" ")[1].split(":")[0]}"
                                                    ":${data[index]['timestamp'].toDate().toString().split(" ")[1].split(":")[1]}",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: (Get.isDarkMode)
                                                          ? Colors.black
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  (data[index].data()[
                                                              'sentby'] ==
                                                          Auth_Helper
                                                              .auth_helper
                                                              .firebaseAuth
                                                              .currentUser
                                                              ?.uid)
                                                      ? Icon(
                                                          Icons
                                                              .done_all_rounded,
                                                          color: (data[index]
                                                                          .data()[
                                                                      'sentby'] ==
                                                                  Auth_Helper
                                                                      .auth_helper
                                                                      .firebaseAuth
                                                                      .currentUser
                                                                      ?.uid)
                                                              ? Colors.blue
                                                              : Colors.black,
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                              backgroundColor: (data[index]
                                                          ['sentby'] ==
                                                      Auth_Helper
                                                          .auth_helper
                                                          .firebaseAuth
                                                          .currentUser
                                                          ?.uid)
                                                  ? Colors.green.shade100
                                                  : Colors.white,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
            SearchBarAnimation(
              hintText: "send message....",
              buttonWidget: Icon(
                Icons.send,
                color: (Get.isDarkMode) ? Colors.black : Colors.black,
              ),
              textEditingController: message_controller,
              isOriginalAnimation: true,
              trailingWidget: GestureDetector(
                onTap: () {
                  FireStore_Helper.fireStore_Helper.sendMessage(
                    uid1: data[0],
                    uid2: data[1],
                    msg: message_controller.text,
                  );
                  Notification_Helper.notification_helper
                      .showNotification(msg: message_controller.text);
                  message_controller.clear();
                },
                child: Icon(
                  Icons.send,
                  color: (Get.isDarkMode) ? Colors.black : Colors.black,
                ),
              ),
              secondaryButtonWidget: Icon(
                Icons.close,
                color: (Get.isDarkMode) ? Colors.black : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
