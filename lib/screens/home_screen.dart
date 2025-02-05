import 'package:deshi_mart/customs/categories.dart';
import 'package:deshi_mart/customs/utils.dart';
import 'package:deshi_mart/customs/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/icons/icon6.png'),
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          //for search box
          SizedBox(
            height: 15,
          ),

          customTile(
            data,
          ),
          //  SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Exclusive Offer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child: Text(
                    'See more',
                    style: TextStyle(
                        color: AppColors.secondaryColor, fontSize: 15),
                  ),
                  //onTap
                ),
              ],
            ),
          ),
          customTile2(exclusive),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Selling',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child: Text(
                    'See more',
                    style: TextStyle(
                        color: AppColors.secondaryColor, fontSize: 15),
                  ),
                  //onTap
                ),
              ],
            ),
          ),

          customTile2(best),
        ],
      ),
    ));
  }
}
