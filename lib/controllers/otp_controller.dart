import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController otpController = TextEditingController();

  Future<void> verifyOTP(ConfirmationResult confirmationResult) async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
          await confirmationResult.confirm(otpController.text);
      isLoading.value = false;
      Get.snackbar('Successful', 'User Registered Successfully');
      // Get.toNamed(RoutesNames.welcomeScreen);
      //null safety remaining
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }
}
