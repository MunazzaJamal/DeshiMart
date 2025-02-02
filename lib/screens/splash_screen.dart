import 'dart:async';
import 'package:deshi_mart/customs/utils.dart';
import 'package:deshi_mart/routes/routes_names.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  nextScreen() async {
    await Future.delayed(Duration(seconds: 4));
    Get.offAllNamed(RoutesName.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromRGBO(255, 88, 88, 1),
        body: Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
          ),
          SizedBox(height: 10),
          Text(
            'DESHI MART',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    ));
  }
}
