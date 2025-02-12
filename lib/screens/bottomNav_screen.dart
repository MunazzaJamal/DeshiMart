//for bottom navigation no need of multiple scaffolds
//Bottom navigation is a part of

import 'package:deshi_mart/customs/utils.dart';
import 'package:deshi_mart/screens/cart_screen.dart';
import 'package:deshi_mart/screens/explore_screen.dart';
import 'package:deshi_mart/screens/favorites_screen.dart';
import 'package:deshi_mart/screens/home_screen.dart';
import 'package:deshi_mart/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';

enum _SelectedTab { Shop, Explore, Cart, Favorite, Profile }

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  var _selectedTab = _SelectedTab.Shop;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  Widget getcurrentview() {
    switch (_selectedTab) {
      case _SelectedTab.Shop:
        return HomeScreen();
      case _SelectedTab.Explore:
        return ExploreScreen();
      case _SelectedTab.Cart:
        return CartScreen();
      case _SelectedTab.Favorite:
        return FavoritesScreen();

      case _SelectedTab.Profile:
        return ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getcurrentview(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          // currentIndex: currentindex,
          // indicatorColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          outlineBorderColor: Colors.black.withOpacity(0.1),
          onTap: _handleIndexChanged,
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: AppColors.secondaryColor,
            ),

            /// Explore
            CrystalNavigationBarItem(
              icon: IconlyBold.search,
              unselectedIcon: IconlyLight.search,
              selectedColor: AppColors.secondaryColor,
            ),

            /// Cart
            CrystalNavigationBarItem(
              icon: IconlyBold.buy,
              unselectedIcon: IconlyLight.buy,
              selectedColor: AppColors.secondaryColor,
            ),

            /// Favorite
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
              selectedColor: AppColors.secondaryColor,
            ),

            /// Profile
            CrystalNavigationBarItem(
              icon: IconlyBold.user_2,
              unselectedIcon: IconlyLight.user,
              selectedColor: AppColors.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
