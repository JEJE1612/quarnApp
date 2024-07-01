import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurankareem/commons/common.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailcontroller = TextEditingController();
  late TextEditingController passwordcontroller = TextEditingController();
  var email = '';
  var password = '';
  var isLoading = false.obs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  String? vaildEmail(String value) {
    if (!GetUtils.isEmail(value.trim())) {
      return "Please Provide Vaild Email";
    }
    return null;
  }

  String? vaildPassword(String value) {}
  Future<void> login() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {}
    isLoading.value = true;
    formKey.currentState!.save();
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) async {
        if (value != null) {
          User? user = FirebaseAuth.instance.currentUser;
          if (!user!.emailVerified) {
            snackMessage("please verify email frist");
            return;
          }
          Get.offAllNamed('/main');
        } else {
          snackMessage("User not found");
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackMessage("No user found for that email .");
      } else if (e.code == 'wrong-password') {
        snackMessage('Wrong password provides for that user');
      }
    }
    cath(e) {
      print(e);
    }

    isLoading.value = false;
  }
}
