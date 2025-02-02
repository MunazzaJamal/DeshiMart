import 'package:deshi_mart/controllers/login_controller.dart';
import 'package:deshi_mart/customs/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Center(
          child: const Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(height: 20),
            Container(
              height: 128,
              width: 128,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(1, 153, 52, 0.5)),
            ),
            SizedBox(height: 10),
            Text(
              'User Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              _loginController.emailController.text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey),
            ),
            Container(
                width: 374,
                height: 101,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(1, 153, 52, 0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(IconlyBold.paper)),
                        IconButton(
                            onPressed: () {}, icon: Icon(IconlyBold.wallet)),
                        IconButton(
                            onPressed: () {}, icon: Icon(IconlyBold.location)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Orders'),
                        Text('Payments'),
                        Text('Address'),
                      ],
                    )
                  ],
                )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, bottom: 15, right: 30),
              child: Column(
                children: [
                  cstmlist('User Details', IconlyBold.profile),
                  cstmlist('Settings', IconlyBold.setting),
                  cstmlist('Help & Support', IconlyBold.message),
                  cstmlist('Change Language', IconlyBold.swap),
                  cstmlist('Logout', IconlyBold.logout),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget cstmlist(txt, icon) {
    return InkWell(
      onTap: () {
        print('$txt Pressed');
      },
      child: ListTile(
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromRGBO(1, 153, 52, 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon, // Icon inside container
                color: Colors.grey[700], // Icon color
              ),
            ),
            SizedBox(width: 10), 
            Text(txt),
          ],
        ),
      ),
    );
  }
}
