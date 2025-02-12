import 'package:get/get.dart';

class CartController extends GetxController {
  var cartprod = <Map<String, dynamic>>[].obs;
  cartAdd(Map<String, dynamic> product) {
    bool productExists = false;

    for (var cartProduct in cartprod) {
      if (cartProduct['name'] == product['name']) {
        cartProduct['quantity']++;
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      cartprod.add({...product, 'quantity': 1});
      print(
          '${product['name']} added ${product['quantity']} '); // this is printing
    }
  }

  void incrementQuantity(int index) {
    cartprod[index]['quantity'] = cartprod[index]['quantity'] + 1;
    print('Added ${cartprod[index]['quantity']}');
    print('Aded ${cartprod}');
    update();
  }

  // Function to decrement quantity
  void decrementQuantity(int index) {
    if (cartprod[index]['quantity'] > 1) {
      cartprod[index]['quantity']--;
    }
    update();
  }

  void removeFromCart(Map<String, dynamic> product) {
    for (var cartProduct in cartprod) {
      if (cartProduct['name'] == product['name']) {
        if (cartProduct['quantity'] > 1) {
          cartProduct['quantity']--;
        } else {
          cartprod.remove(cartProduct);
        }
        break;
      }
    }
  }

  // Function to calculate the total price
  // double orderTotal() {
  //   double total = 0.0;
  //   for (var product in cartProducts) {
  //     total += product['price'] * product['quantity'];
  //   }
  //   return total;
  // }
}
