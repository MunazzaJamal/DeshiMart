import 'package:deshi_mart/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    isLoading.value = true;
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      isLoading.value = false;
      print('Login successful: ${credential.user?.email}');
      Get.snackbar('Successful', '${credential.user?.email} Logged in..');
      Get.to(WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Failed attempt', 'Wrong email or password');
      if (e.code == 'invalid-credential') {
        print('No user found for that email.');
      } else {
        print('Else condition: ${e.code}');
      }
    }
  }
}
