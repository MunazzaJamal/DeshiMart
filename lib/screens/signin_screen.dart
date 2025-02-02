import 'package:deshi_mart/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final SigninController signUpController = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/mask.png'),
        SizedBox(height: 10),
        Text(
          'Get your groceries\n with nectar',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        SizedBox(height: 10),
        Obx(() {
          return signUpController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    TextField(
                      controller: signUpController.phoneController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await signUpController.sendSMS();
                      },
                      child: Text('Send OTP'),
                    )
                  ]));
        })
      ],
    ));
  }
}
