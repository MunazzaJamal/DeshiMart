import 'package:get/get.dart';
//wishlist => fav
//product => that we want to add in favorites
class FavController extends GetxController {
  void addToFav(product, wishlist) {
    bool isAlreadyInWishlist =
        wishlist.any((item) => item['name'] == product['name']);

    if (isAlreadyInWishlist) {
      print('Product is removed from the wishlist.');
      wishlist.removeWhere((item) => item['name'] == product['name']);
      //snackbar
    } else {
      wishlist.add(product);
      print('Product added to the wishlist.');
      //snackbar
    }
  }
}
