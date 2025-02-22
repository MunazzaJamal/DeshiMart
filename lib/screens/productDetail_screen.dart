import 'package:deshi_mart/controllers/cart_controller.dart';
import 'package:deshi_mart/customs/expand.dart';
import 'package:deshi_mart/customs/utils.dart';
import 'package:deshi_mart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  ProductDetailScreen({super.key, required this.product});
  final CartController _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(IconlyLight.arrow_left_2),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
        body: GetBuilder<CartController>(builder: (context) {
          var cartProduct = _cartController.cartprod.firstWhere(
            (element) => element['name'] == product['name'],
            orElse: () => {},
          );
          int quantity = cartProduct.isNotEmpty ? cartProduct['quantity'] : 0;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(product['img']),
                          fit: BoxFit.contain),
                    ),
                  )
                  // Scrollable images
                  // SizedBox(
                  //   height: 200,
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: product['img'].length,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Image.asset(product['img'][index]),
                  //       );
                  //     },
                  //   ),
                  // ),
                  ,
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product['subtitle'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      // const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 150,
                              height: 80,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _cartController
                                              .decrementQuantity(product);
                                        },
                                        icon: const Icon(Icons.remove,
                                            color: AppColors.secondaryColor)),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                          child: Text(
                                        '$quantity',
                                        style: TextStyle(fontSize: 20),
                                      )),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _cartController
                                              .updateQuantity(product);
                                        },
                                        icon: Icon(Icons.add,
                                            color: AppColors.secondaryColor)),
                                  ])),
                          Text(
                            '\$${product['price']}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[300]),
                  ExpandableDescription(
                    title: 'Product Description',
                    description: product['description'],
                  ),
                  Divider(color: Colors.grey[300]),
                  ExpandableDescription(
                    title: 'Nutritions',
                    description: product['nutrition'],
                  ),
                  Divider(color: Colors.grey[300]),
                  ExpandableDescription(
                    title: 'Review',
                    description: product['reviews'],
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(CartScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.greenColor,
                          ),
                          child: Center(
                            child: Text(
                              'Proceed to cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          );
        }));
  }
}
