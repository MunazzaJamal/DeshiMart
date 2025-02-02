import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

//   Widget customSavedButton(wishlist, isSaved) {
//     return ElevatedButton.icon(
//       onPressed: () {
//         setState(() {
//           if (isSaved) {
//             addToWishlist(widget.product, wishlist);
//             print(isSaved);
//           } else {
//             addToWishlist(widget.product, wishlist);
//             print(isSaved);
//           }
//           isSaved = !isSaved;
//         });
//       },
//       icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
//       label: Text(
//         isSaved ? 'Saved' : 'Save',
//         style: const TextStyle(fontSize: 10),
//       ),
//       style: ElevatedButton.styleFrom(
//         fixedSize: const Size(100, 54),
//         backgroundColor: const Color.fromRGBO(234, 241, 255, 1),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//     );
//   }

//   void addToWishlist(product, wishlist) {
//     bool isAlreadyInWishlist =
//         wishlist.any((item) => item['title'] == product['title']);

//     if (isAlreadyInWishlist) {
//       print('Product is removed from the wishlist.');
//       wishlist.removeWhere((item) => item['title'] == product['title']);
//     } else {
//       wishlist.add(product);
//       print('Product added to the wishlist.');
//     }
//   }
}
