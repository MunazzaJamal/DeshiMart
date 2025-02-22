import 'dart:ui';

import 'package:deshi_mart/controllers/cart_controller.dart';
import 'package:deshi_mart/controllers/checkout_controller.dart';
import 'package:deshi_mart/customs/order_failed_widget.dart';
import 'package:deshi_mart/customs/order_success_widget.dart';
import 'package:deshi_mart/customs/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

final CartController cartController = Get.put(CartController());
final CheckoutController _checkoutController = Get.put(CheckoutController());

showCheckoutModal() {
  Get.bottomSheet(
    Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Blur effect
          child: Container(
            color: Colors.black.withOpacity(0.5), // Dark overlay
          ),
        ),
        // Checkout modal content
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Get.height * 0.5, // Half screen height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                // Header or drag handle
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                // Add your checkout content here
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      Divider(
                        color: Colors.grey[300],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Delivery Method',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Obx(() => Text(
                                      _checkoutController.deliveryMethod.value,
                                      style: TextStyle(fontSize: 18),
                                    )),
                                IconButton(
                                  onPressed: () => _showMethodsBottomSheet(
                                    title: 'Select Delivery Method',
                                    methods:
                                        _checkoutController.deliveryMethods,
                                    onMethodSelected: (method) {
                                      _checkoutController.deliverymethod(
                                          method); // Update delivery method
                                    },
                                  ),
                                  icon: Icon(IconlyLight.arrow_right_2),
                                ),
                              ],
                            )
                          ]),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Payment Method',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Obx(() => Text(
                                      _checkoutController.paymentMethod.value,
                                      style: TextStyle(fontSize: 18),
                                    )),
                                IconButton(
                                  onPressed: () => _showMethodsBottomSheet(
                                    title: 'Select Payment Method',
                                    methods: _checkoutController.paymentMethods,
                                    onMethodSelected: (method) {
                                      _checkoutController.paymentMethod(
                                          method); // Update delivery method
                                    },
                                  ),
                                  icon: Icon(IconlyLight.arrow_right_2),
                                ),
                              ],
                            )
                          ]),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enter Promo Code',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Obx(() => Text(
                                      _checkoutController.promoCode.value,
                                      style: TextStyle(fontSize: 18),
                                    )),
                                IconButton(
                                  onPressed: () => _showPromoCodeDialog(),
                                  icon: Icon(IconlyLight.arrow_right_2),
                                ),
                              ],
                            )
                          ]),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Total Cost',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Obx(
                              () => Text(
                                '\$' +
                                    _checkoutController
                                        .totalPrice(cartController.orderTotal(),
                                            _checkoutController.promoCode.value)
                                        .toStringAsFixed(2),
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ]),
                      SizedBox(height: 18),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      ElevatedButton(
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
                          print('placing order');

                          if (_checkoutController.placeOrder()) {
                            //print(_checkoutController.placeOrder());
                            // Show success dialog and navigate
                            onOrderSuccess();
                          } else {
                            onOrderFailure();
                          }
                        },
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    isScrollControlled: true, // Allows the modal to take up more space
    backgroundColor: Colors.transparent,
  );
}

void _showPromoCodeDialog() {
  final TextEditingController promoCodeController = TextEditingController();

  Get.defaultDialog(
    title: 'Enter Promo Code',
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: promoCodeController,
          decoration: InputDecoration(
            hintText: 'Enter your promo code',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            String promoCode = promoCodeController.text.trim();
            _checkoutController.promocodemethod(promoCode);

            _checkoutController.totalPrice(
                cartController.orderTotal(), promoCode); // Apply promo code
            Get.back(); // Close the dialog
          },
          child: Text('Apply'),
        ),
      ],
    ),
  );
}

void _showMethodsBottomSheet({
  required String title, // Title of the bottom sheet
  required List<String> methods, // List of methods (delivery or payment)
  required Function(String)
      onMethodSelected, // Callback when a method is selected
}) {
  Get.bottomSheet(
    Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 25),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum space
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ...methods.map((method) => ListTile(
                  title: Text(method),
                  onTap: () {
                    onMethodSelected(
                        method); // Call the callback with the selected method
                    Get.back(); // Close the bottom sheet
                  },
                )),
          ],
        ),
      ),
    ),
  );
}

// void _showMethodsBottomSheet({
//   required String title, // Title of the bottom sheet
//   required List<String> methods, // List of methods (delivery or payment)
//   required Function(String)
//       onMethodSelected, // Callback when a method is selected
// }) {
//   Get.bottomSheet(
//     Container(
//       color: Colors.white,
//       padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 25),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 16),
//           ...methods.map((method) => ListTile(
//                 title: Text(method),
//                 onTap: () {
//                   onMethodSelected(
//                       method); // Call the callback with the selected method
//                   Get.back(); // Close the bottom sheet
//                 },
//               )),
//         ],
//       ),
//     ),
//   );

// }
