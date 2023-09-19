import 'dart:developer';

import 'package:chat_app_flutter_app/Views/Components/Chat/chat_screen.dart';
import 'package:chat_app_flutter_app/Views/Screens/intro_screen.dart';
import 'package:chat_app_flutter_app/Views/Screens/login_screen.dart';
import 'package:chat_app_flutter_app/Views/Screens/notification.dart';
import 'package:chat_app_flutter_app/Views/Screens/setting_page.dart';
import 'package:chat_app_flutter_app/Views/Screens/signup_screen.dart';
import 'package:chat_app_flutter_app/Views/Screens/splesh_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Views/Components/Chat/chat_home_screen.dart';
import 'Views/Screens/home_page.dart';
import 'Views/Screens/otp_verify.dart';
import 'Views/Screens/phone_otp.dart';
import 'Views/Screens/profile_page.dart';
import 'firebase_options.dart';

Future<void> FCMbackGroundMessage(RemoteMessage message) async {
  log("==== =====================================");
  log("${message.notification}");
  log("=========================================");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(FCMbackGroundMessage);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/',
          page: () => const SpleshScreen(),
        ),
        GetPage(
          name: '/intro',
          page: () => const IntroScreen(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: '/phoneotp',
          page: () => const PhoneOTPScreen(),
        ),
        GetPage(
          name: '/otpverify_page',
          page: () => const VerifyOTPScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/chat_home',
          page: () => const Chat_Home_Screen(),
        ),
        GetPage(
          name: '/chat',
          page: () => const ChatScreen(),
        ),
        GetPage(
          name: '/setting',
          page: () => const SettingPage(),
        ),
        GetPage(
          name: '/profile',
          page: () => const ProfilePage(),
        ),
        GetPage(
          name: '/notification',
          page: () => const Notification_Screen(),
        ),
      ],
    ),
  );
}
