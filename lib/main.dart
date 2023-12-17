import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Modules/Views/Screens/Chat_Screen/Chat_Home_Screen/chat_home_screen.dart';
import 'Modules/Views/Screens/Chat_Screen/Chating_Screen/Views/chat_screen.dart';
import 'Modules/Views/Screens/Home_Screen/Views/Home_Page/home_page.dart';
import 'Modules/Views/Screens/Intro_Screen/intro_screen.dart';
import 'Modules/Views/Screens/Login_SignUP_Screen/Views/Login_Screen/login_screen.dart';
import 'Modules/Views/Screens/Login_SignUP_Screen/Views/SignUp_Screen/signup_screen.dart';
import 'Modules/Views/Screens/Notification_Screen/Helper/Views/notification.dart';
import 'Modules/Views/Screens/OTP_Screen/Send_OTP_Screen/phone_otp.dart';
import 'Modules/Views/Screens/OTP_Screen/Verify_OTP_Screen/otp_verify.dart';
import 'Modules/Views/Screens/Profile_Screen/profile_page.dart';
import 'Modules/Views/Screens/Setting_Screen/setting_page.dart';
import 'Modules/Views/Screens/Splesh_Screen/splesh_screen.dart';
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
