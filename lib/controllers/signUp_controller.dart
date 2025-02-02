import 'package:deshi_mart/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  registeruser() async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      isLoading.value = false;
      print('User registered: ${userCredential.user?.email}');
      // Get.to
      Get.snackbar('Successful', 'You are registered successfully.');
      Get.to(LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar('Error', 'The account already exists for that email.');
      } else if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print(e);
    }
  }
}
