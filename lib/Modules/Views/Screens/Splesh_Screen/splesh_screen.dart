import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpleshScreen extends StatelessWidget {
  const SpleshScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed("/intro");
    });
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/image/spelsh.png",
                ),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
