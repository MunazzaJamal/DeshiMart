import 'package:deshi_mart/customs/utils.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )),
      ),
      body: cartTile(),
    );
  }

  Widget cartTile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 155,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/img1.jpg',
                    width: 70,
                    height: 65,
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Data',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'subData',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(
                          width: 150,
                          height: 80,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove,
                                        color: AppColors.secondaryColor)),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child: Text(
                                    '1',
                                    style: TextStyle(fontSize: 20),
                                  )),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add,
                                        color: AppColors.secondaryColor)),
                              ])),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 15,
                top: 15,
                child: Icon(
                  Icons.delete,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
