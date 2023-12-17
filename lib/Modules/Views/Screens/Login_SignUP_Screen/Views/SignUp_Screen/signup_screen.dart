import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/utils.dart';
import '../../Auth_Helper/firebase_auth_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.teal.shade700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: signUpformkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal.shade700,
                  ),
                ),
                TextFormField(
                  controller: signinemailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Enter your e-mail id"),
                    hintText: "Enter email here...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    signupEmail = value;
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter email first...";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal.shade700,
                  ),
                ),
                TextFormField(
                  controller: signinpasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Enter your password"),
                    hintText: "Enter password here...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    signupPassword = value;
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter password first...";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Confirm password",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal.shade700,
                  ),
                ),
                TextFormField(
                  controller: signinconfirmpasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    label: Text("Enter your confirm password"),
                    hintText: "Enter password here...",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    signupConfirmPass = value;
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter confirm password...";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Auth_Helper.auth_helper.SignUp(
                          email: signupEmail!, password: signupPassword!);
                      Get.offNamed('/home');
                      Get.snackbar("SUCCESSFULLY",
                          "Create Account Successfully with Email..",
                          backgroundColor: Colors.green);
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.teal.shade700,
                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "or continue with",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.offAllNamed('/phoneotp');
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal.shade700,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In with Phone number",
                          style: TextStyle(
                            color: Colors.teal.shade700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        foregroundImage:
                            const AssetImage("assets/image/google.jpg"),
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            User? res = await Auth_Helper.auth_helper
                                .signInWithGoogle();
                            if (res != null) {
                              Get.offNamed('/home', arguments: res);
                              Get.snackbar("SUCCESSFULLY",
                                  "Login Successfully with Google😊..",
                                  backgroundColor: Colors.green);
                            } else {
                              Get.snackbar("FAILURE", "Login Failed!!",
                                  backgroundColor: Colors.red);
                            }
                          },
                          icon: const Icon(Icons.supervised_user_circle),
                          label: const Text("Sign in with google"),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      CircleAvatar(
                        radius: 18,
                        foregroundImage:
                            const AssetImage("assets/image/user.jpg"),
                        child: OutlinedButton(
                          onPressed: () async {
                            User? res =
                                await Auth_Helper.auth_helper.SigninAnonymous();
                            if (res != null) {
                              Get.offNamed('/home', arguments: res);
                              Get.snackbar("SUCCESSFULLY",
                                  "Login Successfully with Anonymous😊..",
                                  backgroundColor: Colors.green);
                            } else {
                              Get.snackbar("FAILURE", "Login Failed!!",
                                  backgroundColor: Colors.red);
                            }
                          },
                          child: const Text("Sign in Anonymous"),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      CircleAvatar(
                        radius: 15,
                        foregroundImage:
                            const AssetImage("assets/image/facebook.jpg"),
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          // onPressed: () async {
                          //   Map<String, dynamic> data = await FirebaseAuthHelper
                          //       .firebaseAuthHelper
                          //       .signInWithFacebook();
                          //
                          //   if (data['user'] != null) {
                          //     Get.snackbar("SUCCESSFULLY",
                          //         "Login Successfully with Facebook😊..",
                          //         backgroundColor: Colors.green);
                          //     Get.offNamed('/', arguments: data['user']);
                          //     logINOutController.logInOutTrueValue();
                          //   } else {
                          //     Get.snackbar(
                          //       "FAILURE",
                          //       data['msg'],
                          //       backgroundColor: Colors.red,
                          //     );
                          //   }
                          // },
                          icon: const Icon(Icons.facebook),
                          label: const Text(
                            "Sign in with facebook",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed('/login');
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account ?? ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
