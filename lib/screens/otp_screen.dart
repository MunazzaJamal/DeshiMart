import 'package:deshi_mart/controllers/otp_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {

  final ConfirmationResult confirmationResult;

  OTPScreen({super.key,required this.confirmationResult});

  
 final OtpController _otpController = Get.put(OtpController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController.otpController,
              decoration: InputDecoration(labelText: 'Enter OTP'),
            ),
            SizedBox(height: 20),

Obx(() {
                    return _otpController.isLoading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              await _otpController.verifyOTP(confirmationResult);
                            },
                            child: Text('Verify'),
                          );
                  }),


            // ElevatedButton(
            //   onPressed: () async {


                // try {
                //   UserCredential userCredential = await confirmationResult.confirm(otpController.text);
                //   Get.snackbar('Success', 'User registered successfully');
                // } catch (e) {
                //   Get.snackbar('Error', e.toString());
                // }
            //   },
            //   child: Text('Verify'),
            // ),
          ],
        ),
      ),
    );
  }
}