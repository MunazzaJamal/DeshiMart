import 'package:deshi_mart/screens/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  var isLoading = false.obs;
  TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendSMS() async {
    isLoading.value = true;
    try {
      ConfirmationResult confirmationResult = 
      await auth.signInWithPhoneNumber(phoneController.text);
      isLoading.value = false;
      Get.to(() => OTPScreen(confirmationResult: confirmationResult));
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }
}