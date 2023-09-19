import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed('profile');
                },
                child: Row(
                  children: [
                    const CircleAvatar(
                        foregroundImage: AssetImage(
                          "assets/image/bonika.jpg",
                        ),
                        radius: 30 // height * 0.092,
                        ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Boni Desai",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "If God blessing no matter....",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.qr_code_scanner_rounded,
                      color: Colors.teal.shade700,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              const SizedBox(
                height: 10,
              ),
              //account
              Row(
                children: [
                  Icon(
                    Icons.key,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Security notifications, change number",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //privacy
              Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Privacy",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Block contacts, disappearing\nmessages",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //avtar
              Row(
                children: [
                  Icon(
                    Icons.face,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Avatar",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Create, edit, profile, photo",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //chat
              Row(
                children: [
                  Icon(
                    Icons.chat,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Chats",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Theme, wallpepar, chat histroy",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //notification
              Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Message, group & call tones",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //storage
              Row(
                children: [
                  Icon(
                    Icons.data_saver_off,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Storage and data",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Network usage, auto-download",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //app language
              Row(
                children: [
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "App language",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "English (device's language)",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //help
              Row(
                children: [
                  Icon(
                    Icons.question_mark,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Help",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Help center, contact us, privacy pollcy",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //theme
              GestureDetector(
                onTap: () {
                  Get.changeTheme(Get.isDarkMode == true
                      ? ThemeData.light(useMaterial3: true)
                      : ThemeData.dark(useMaterial3: true));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.color_lens_outlined,
                      color: Colors.grey.shade700,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Theme",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Dark theme, light theme",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ), //invite
              Row(
                children: [
                  Icon(
                    Icons.people,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    "Invite a friend",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
