import 'package:deshi_mart/routes/routes_names.dart';
import 'package:deshi_mart/screens/login_screen.dart';
import 'package:deshi_mart/screens/signUp_screen.dart';
import 'package:deshi_mart/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splash,
          page: () => SplashScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(seconds: 5),
        ),
        GetPage(
          name: RoutesName.signin, // Define the new route for HomeScreen2
          page: () => LoginScreen(),
          transition: Transition
              .rightToLeftWithFade, // You can use a different transition
        ),
        GetPage(
          name: RoutesName.signUp, // Define the new route for HomeScreen2
          page: () => SignupScreen(),
          transition: Transition
              .rightToLeftWithFade, // You can use a different transition
        ),
        GetPage(
          name: RoutesName.login, // Define the new route for HomeScreen2
          page: () => LoginScreen(),
          transition: Transition
              .rightToLeftWithFade, // You can use a different transition
        ),
      ];
}
