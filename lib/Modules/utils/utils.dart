import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

final GlobalKey<FormState> signUpformkey = GlobalKey<FormState>();
final GlobalKey<FormState> signInformkey = GlobalKey<FormState>();

TextEditingController signupemailController = TextEditingController();
TextEditingController signuppasswordController = TextEditingController();

TextEditingController signinemailController = TextEditingController();
TextEditingController signinpasswordController = TextEditingController();
TextEditingController signinconfirmpasswordController = TextEditingController();

TextEditingController phoneController = TextEditingController();
TextEditingController otpController = TextEditingController();

TextEditingController message_controller = TextEditingController();
TextEditingController countryController = TextEditingController();
GlobalKey<FormState> otploginformkey = GlobalKey<FormState>();

GlobalKey<FormState> otpverifyformkey = GlobalKey<FormState>();
var code = "";
final FirebaseAuth auth = FirebaseAuth.instance;
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
String phonenumber = "";
String? email;
String? password;
String? signupEmail;
String? signupPassword;
String? signupConfirmPass;

final box = GetStorage();
