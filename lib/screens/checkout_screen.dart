import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

customDialog() {
  Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.white,
        child: PopScope(
          canPop: true,
          child: Container(
            width: 300, height: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('CheckOut', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  IconButton(onPressed: (){}, icon: Icon(IconlyLight.close_square), color: Colors.grey,)
                ],)
               , Divider(color: Colors.grey,),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Delivery', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  
                ],)
              ],
            ),
          ),
        ),
      ));
}
