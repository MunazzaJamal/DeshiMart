import 'package:get/get.dart';

class CheckoutController extends GetxController {
  var deliveryMethod = 'Select Method'.obs;
  var paymentMethod = 'Select Method'.obs;
  var promoCode = ''.obs;

  // List of available delivery methods
  final List<String> deliveryMethods = [
    'Standard Delivery',
    'Express Delivery',
    'Pickup',
  ];

  // List of available payment methods
  final List<String> paymentMethods = [
    'Cash on Delivery',
    'Credit Card',
    'Debit Card',
  ];

  final List<String> promocodes = [
    'Code 15%',
    'Code 20%',
    'Code 30%',
    'Code 40%',
  ];
  // Function to update the selected method
  void deliverymethod(String method) {
    deliveryMethod.value = method;
  }

  void paymentmethod(String method) {
    paymentMethod.value = method;
  }

  void promocodemethod(String code) {
    promoCode.value = code;
  }

  final Map<String, double> promoCodeDiscounts = {
    'Code 15%': 0.85,
    'Code 20%': 0.80,
    'Code 30%': 0.70,
    'Code 40%': 0.60,
  };

  double totalPrice(double cartPrice, String? promoCode) {
    if (cartPrice < 0) {
      throw ArgumentError('Cart price cannot be negative');
    }

    if (promoCode != null && promoCodeDiscounts.containsKey(promoCode)) {
      double discountMultiplier = promoCodeDiscounts[promoCode]!;
      print('${(1 - discountMultiplier) * 100}% discount applied');
      return cartPrice * discountMultiplier;
    } else if (promoCode != null) {
      print('Invalid promo code: $promoCode');
    } else {
      print('No promo code applied');
    }
    return cartPrice;
  }

  // double totalprice(double cartPrice) {
  //   if (promoCode.value == 'Code 15%') {
  //     print('15% discount');
  //     return cartPrice * 0.85;
  //   } else if (promoCode.value == 'Code 20%') {
  //     print('20% discount');
  //     return cartPrice * 0.80;
  //   } else if (promoCode.value == 'Code 30%') {
  //     print('30% discount');
  //     return cartPrice * 0.70;
  //   } else if (promoCode.value == 'Code 40%') {
  //     print('40% discount');
  //     return cartPrice * 0.60;
  //   } else {
  //     print('No discount');
  //     return cartPrice;
  //   }
  // }
}
