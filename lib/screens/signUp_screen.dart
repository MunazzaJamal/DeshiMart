// import 'package:deshi_mart/controllers/signUp_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignupScreen extends StatelessWidget {
//   SignupScreen({super.key});
//   final SignUpController _signUpController = Get.put(SignUpController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('SignUp Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // logo(clr: Colors.black),
//             const SizedBox(height: 100),
//             SizedBox(
//               width: 500,
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _signUpController.emailController,
//                     obscureText: false,
//                     decoration: InputDecoration(
//                       border: const OutlineInputBorder(),
//                       labelText: 'Email',
//                     ),
//                   ),
//                   SizedBox(height: 10), // Add spacing between TextFields
//                   TextField(
//                     controller: _signUpController.passwordController,
//                     obscureText: true, // To hide password text
//                     decoration: InputDecoration(
//                       border: const OutlineInputBorder(),
//                       labelText: 'Password',
//                     ),
//                   ),
//                   SizedBox(height: 10), // Add spacing between TextFields
//                   // TextField(
//                   //   controller: controller.phoneNo,
//                   //   obscureText: true, // To hide password text
//                   //   decoration: InputDecoration(
//                   //     border: const OutlineInputBorder(),
//                   //     labelText: 'Password',
//                   //   ),
//                   // ),
//                   // SizedBox(height: 10), // Add spacing between TextFields
//                   // TextField(
//                   //   controller: controller.fullName,
//                   //   obscureText: true, // To hide password text
//                   //   decoration: InputDecoration(
//                   //     border: const OutlineInputBorder(),
//                   //     labelText: 'Password',
//                   //   ),
//                   //),
//                   SizedBox(height: 20), // Add spacing before the button

//                   Obx(() {
//                     return _signUpController.isLoading.value
//                         ? CircularProgressIndicator()
//                         : ElevatedButton(
//                             onPressed: () async {
//                               await _signUpController.registeruser();
//                             },
//                             child: Text('Register'),
//                           );
//                   }),

//                   // ElevatedButton(
//                   //   onPressed: () async {
//                   //     await controller.registeruser(email, password);
//                   //   }, // Call the login function
//                   //   child: Text('Register'),
//                   // ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () async {
//                      // Get.toNamed(RoutesNames.login);
//                       // await Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => FirebaseLogin()));
//                     }, // Call the login function
//                     child: Text('Already have an account? Login'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RoutesNames {
// }

import 'package:deshi_mart/controllers/signUp_controller.dart';
import 'package:deshi_mart/screens/login_screen.dart';
import 'package:deshi_mart/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isObscure = true;
  final SignUpController _signUpController = Get.put(SignUpController());

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
            'Sign Up',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('Enter your credentials to continue.',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _signUpController.emailController,
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
              controller: _signUpController.passwordController,
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
                  _signUpController.registeruser();
                  
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(364, 50),
                  backgroundColor: Color.fromRGBO(83, 177, 117, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign in with phone? ', style: TextStyle(fontSize: 14)),
              InkWell(
                onTap: () => Get.to(SigninScreen()),
                child: Text('Yes.!',
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(83, 177, 117, 1))),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account? ', style: TextStyle(fontSize: 14)),
              InkWell(
                onTap: () => Get.to(LoginScreen()),
                child: Text(' Login',
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
