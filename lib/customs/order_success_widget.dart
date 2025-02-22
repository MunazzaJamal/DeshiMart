import 'package:deshi_mart/screens/bottomNav_screen.dart';
import 'package:deshi_mart/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void onOrderSuccess() {
  Get.dialog(
    AlertDialog(
      title: Center(child: Text('Order Successful')), // Center the title
      content: Column(
        mainAxisSize: MainAxisSize.min, // Use minimum space
        children: [
          // Centered image at the top
          Center(
            child: Image.asset(
              'assets/images/img11.png', // Replace with your image path
              height: 150, // Adjust height as needed
              width: 150, // Adjust width as needed
            ),
          ),
          SizedBox(height: 16), // Add spacing between image and text
          // Text below the image
          Text(
            'Your order has been placed successfully!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, // Center the text
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.to(Screen2());
          },
          child: Text('OK'),
        ),
      ],
    ),
  );
}
