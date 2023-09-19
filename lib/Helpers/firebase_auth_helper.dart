import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/utils.dart';
import 'firebase_cloud_firestore_helper.dart';

class Auth_Helper {
  Auth_Helper._();

  static Auth_Helper auth_helper = Auth_Helper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  get verificationid => "";
  Future<User?> SigninAnonymous() async {
    UserCredential userCredential = await firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<User?> SignUp(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<Map<String, dynamic>> SignIn(
      {required String email, required String password}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      FireStore_Helper.fireStore_Helper.addUser(data: {
        "email": userCredential.user?.email,
        "uid": userCredential.user?.uid,
      });
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  // SigninWith Google
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    var credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);

    User? user = userCredential.user;
    FireStore_Helper.fireStore_Helper.addUser(data: {
      "email": user?.email,
      "uid": user?.uid,
    });
    return user;
  }
//signInFacebook
//   Future signInWithFacebook() async {
//     Map<String, dynamic> data = {};
//
//     try {
//       LoginResult loginResult =
//       await facebookAuth.login(permissions: ['email']);
//
//       if (loginResult == LoginStatus.success) {
//         data = await facebookAuth.getUserData();
//       } else {
//         print(loginResult.message);
//       }
//
//       OAuthCredential oAuthCredential =
//       FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//       UserCredential userCredential =
//       firebaseAuth.signInWithCredential(oAuthCredential) as UserCredential;
//
//       User? user = userCredential.user;
//       print(user);
//
//       data['user'] = user;
//     } on FirebaseAuthException catch (e) {
//       switch (e.code) {
//         case "admin-restricted-operation":
//           data['msg'] = "This service is temporary down.";
//         case "There is no user record corresponding to this identifier":
//           data['msg'] = "This user is not available.";
//         default:
//           data['msg'] = e.code;
//       }
//     }
//   }

  Future fetchOTP() async {
    String verificationId = "";

    await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneController.text.toString(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential authCredential =
              await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print("Invalid phone number");

            Get.snackbar("${e.message.toString()}", "Not Successfully");
          }
        },
        codeSent: (String verificationid, int? resendToken) async {
          this.verificationid == verificationid;
        },
        codeAutoRetrievalTimeout: (String verificationid) {});
  }

  Future veRIfy() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationid.toString(),
      smsCode: otpController.text.toString(),
    );
    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(phoneAuthCredential);

    if (userCredential.user != null) {
      Get.toNamed('/');

      Get.snackbar("SUCCESSFULLY LOGIN", "${userCredential.user}",
          backgroundColor: Colors.green);
    }

    // User? user = userCredential.user;
  }

  Future signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      Auth_Helper.auth_helper.veRIfy();

      final authCredential =
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        Get.toNamed('/');
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void SignOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
