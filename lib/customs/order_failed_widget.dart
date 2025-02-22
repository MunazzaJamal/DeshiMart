import 'package:deshi_mart/screens/bottomNav_screen.dart';
import 'package:deshi_mart/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void onOrderFailure() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      title: Center(child: Text('Oops! Order Failed')), // Center the title
      content: Column(
        mainAxisSize: MainAxisSize.min, // Use minimum space
        children: [
          // Centered image at the top
          Center(
            child: Image.asset(
              'assets/images/img10.png', // Replace with your image path
              height: 150, // Adjust height as needed
              width: 150, // Adjust width as needed
            ),
          ),
          SizedBox(height: 16), // Add spacing between image and text
          // Text below the image
          Text(
            'Something went wrong!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, // Center the text
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Try again')),
        TextButton(
          onPressed: () {
            Get.back();
            Get.to(Screen2()); // Close the dialog
          },
          child: Text('Back to Home'),
        ),
      ],
    ),
  );
}
