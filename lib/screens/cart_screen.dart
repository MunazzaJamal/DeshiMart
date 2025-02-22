import 'package:deshi_mart/controllers/cart_controller.dart';
import 'package:deshi_mart/customs/utils.dart';
import 'package:deshi_mart/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartController _cartController = Get.put(CartController());
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
        body: _cartController.cartprod.isEmpty
            ? Center(
                child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : GetBuilder<CartController>(builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: _cartController.cartprod.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 155,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            _cartController.cartprod[index]
                                                ['img'],
                                            width: 70,
                                            height: 65,
                                          ),
                                          SizedBox(width: 30),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // SizedBox(
                                              //   height: 5,
                                              // ),
                                              Text(
                                                _cartController.cartprod[index]
                                                    ['name'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                _cartController.cartprod[index]
                                                    ['subtitle'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                  width: 150,
                                                  height: 80,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                              _cartController
                                                                  .DecrementCart(
                                                                      index);
                                                            },
                                                            icon: const Icon(
                                                                Icons.remove,
                                                                color: AppColors
                                                                    .secondaryColor)),
                                                        Container(
                                                          height: 40,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            _cartController
                                                                .cartprod[index]
                                                                    ['quantity']
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          )),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              _cartController
                                                                  .incrementQuantity(
                                                                      index);
                                                            },
                                                            icon: Icon(
                                                                Icons.add,
                                                                color: AppColors
                                                                    .secondaryColor)),
                                                      ])),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: 15,
                                        top: 15,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                          ),
                                          color: AppColors.secondaryColor,
                                          onPressed: () {
                                            _cartController.removeFromCart(
                                                _cartController
                                                    .cartprod[index]);
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        right: 15,
                                        top: 75,
                                        child: Text(
                                          '\$${_cartController.cartprod[index]['price']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greenColor,
                                // padding:
                                //     EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Set border radius
                                ),
                                fixedSize: Size(300, 50)),
                            onPressed: () {
                              showCheckoutModal();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Go to Checkout',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '\$${_cartController.orderTotal().toStringAsFixed(2)}',
                                  // '\$${_cartController.orderTotal()}'.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              }));
  }
}
