import 'package:deshi_mart/firebase_options.dart';
import 'package:deshi_mart/screens/bottomNav_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // getPages: AppRoutes.appRoutes(),
      home: Screen2(),
      // home: CartScreen(product: fruits[0]),
    );
  }
}
