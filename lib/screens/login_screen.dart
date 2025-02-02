import 'package:deshi_mart/controllers/login_controller.dart';
import 'package:deshi_mart/screens/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Center(child: Image.asset('assets/icons/icon6.png')),
          SizedBox(height: 100),
          Text(
            'Login',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('Enter your email and password.',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _loginController.emailController,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 15),
            ),
          ),
          SizedBox(height: 10),

          TextField(
              controller: _loginController.passwordController,
              obscureText: _isObscure, // Toggle the visibility
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure; // Toggle the visibility state
                    });
                  },
                ),
              )),

          // TextField(
          //   // controller: _signUpController.emailController,
          //   obscureText: false,
          //   decoration: InputDecoration(
          //     labelText: 'Password',
          //     labelStyle: TextStyle(
          //         color: Colors.grey,
          //         fontStyle: FontStyle.italic,
          //         fontSize: 15),
          //   ),
          // ),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  _loginController.login();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(364, 50),
                  backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?', style: TextStyle(fontSize: 14)),
              InkWell(
                onTap: () => Get.to(SignupScreen()),
                child: Text(' Sign Up',
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(83, 177, 117, 1))),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
