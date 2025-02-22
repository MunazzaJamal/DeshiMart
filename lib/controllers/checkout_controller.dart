import 'package:get/get.dart';

class CheckoutController extends GetxController {
  var deliveryMethod = ''.obs;
  var paymentMethod = ''.obs;
  var promoCode = ''.obs;
  var chk = false.obs;
  var cartPrice = 0.0.obs; // Observable cart price

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

  bool placeOrder() {
    if (deliveryMethod.value.isNotEmpty && paymentMethod.value.isNotEmpty) {
      chk.value = true;
      print('Delivery and Payment methods selected');
    } else {
      chk.value = false;
      print('2nd');
      print('Delivery or Payment method not selected');
    }
    print(deliveryMethod.value);
    print(paymentMethod.value);
    return chk.value;
  }

  // Function to update the selected method
  void deliverymethod(String method) {
    deliveryMethod.value = method;
  }

  void paymentmethod(String method) {
    paymentMethod.value = method;
  }

  void promocodemethod(String code) {
    promoCode.value = code;
    print(promoCode.value);
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
      print(cartPrice * discountMultiplier);
      return cartPrice * discountMultiplier;
    } else if (promoCode != null) {
      print('Invalid promo code: $promoCode');
      return cartPrice;
    } else {
      print('No promo code applied');
      return cartPrice;
    }
  }
}
