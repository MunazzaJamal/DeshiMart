import 'package:get/get.dart';

class CartController extends GetxController {
  var cartprod = <Map<String, dynamic>>[].obs;

  updateQuantity(product) {
    bool productExists = false;

    for (var cartProduct in cartprod) {
      if (cartProduct['name'] == product['name']) {
        cartProduct['quantity'] = cartProduct['quantity'] + 1;
        print(cartProduct['quantity']);
        productExists = true;
        // print('$product exists');
        update();
        break;
      }
    }

    // print('else');
    if (!productExists) {
      cartAdd(product);
      print('aDDING');
    }
  }

  cartAdd(Map<String, dynamic> product) {
    cartprod.add({...product, 'quantity': 1});
    print('${product['name']} added ${product['quantity']} ');
    // this is printing
    update();
  }

  void incrementQuantity(int index) {
    cartprod[index]['quantity'] = cartprod[index]['quantity'] + 1;
    print('Added ${cartprod[index]['quantity']}');
    print('Aded $cartprod');
    update();
  }

  void DecrementCart(index) {
    if (cartprod[index]['quantity'] > 1) {
      cartprod[index]['quantity']--;
    } else
      removeFromCart(cartprod[index]);
    update();
  }

  // Function to decrement quantity
  void decrementQuantity(product) {
    bool productExists = false;

    print('decrement');
    for (var cartProduct in cartprod) {
      if (cartProduct['name'] == product['name']) {
        if (cartProduct['quantity'] >= 1) {
          cartProduct['quantity'] = cartProduct['quantity'] - 1;
          print(cartProduct['quantity']);
          productExists = true;

          update();
          break;
        } else
          removeFromCart(product);
      } else
        print('else cond');
      removeFromCart(product);
    }
//    }
  }

  void removeFromCart(Map<String, dynamic> product) {
    // print('$product');
    for (var cartProduct in cartprod) {
      if (cartProduct['name'] == product['name']) {
        cartprod.remove(cartProduct);
        update();
        break;
      }
    }
  }

  //Function to calculate the total price
  double orderTotal() {
    double total = 0.0;
    for (var product in cartprod) {
      total += product['price'] * product['quantity'];
      print(total);
    }
    return total;
  }
}
