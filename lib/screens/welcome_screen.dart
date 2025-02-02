import 'package:deshi_mart/customs/utils.dart';
import 'package:deshi_mart/screens/bottomNav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 50, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/clr_logo.png'),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'DESHI',
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' MART',
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              // SizedBox(height: 3),
              Text('Desh ka Market',
                  style: TextStyle(fontSize: 13, color: Colors.grey)),
              SizedBox(height: 20),
              Row(children: [
                Image.asset('assets/icons/icon1.png'),
                SizedBox(width: 10),
                Text(
                  'Organic Groceries',
                  style: TextStyle(color: Colors.grey),
                )
              ]),
              Divider(),
              Row(children: [
                Image.asset('assets/icons/icon2.png'),
                SizedBox(width: 10),
                Text(
                  'Whole foods and vegetables',
                  style: TextStyle(color: Colors.grey),
                )
              ]),
              Divider(),
              Row(children: [
                Image.asset('assets/icons/icon3.png'),
                SizedBox(width: 10),
                Text(
                  'Fast Delivery',
                  style: TextStyle(color: Colors.grey),
                )
              ]),
              Divider(),
              Row(children: [
                Image.asset('assets/icons/icon4.png'),
                SizedBox(width: 10),
                Text(
                  'Easy return and refund',
                  style: TextStyle(color: Colors.grey),
                )
              ]),
              Divider(),
              Row(children: [
                Image.asset('assets/icons/icon5.png'),
                SizedBox(width: 10),
                Text(
                  'Secure and Safe',
                  style: TextStyle(color: Colors.grey),
                )
              ]),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Welcome to our store',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Get your grocery in as fast as\n                  one hours',
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    height: 45,
                    width: 342,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(
                            Screen2(),
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
