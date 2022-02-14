import 'package:e_unique_school/model/ebook_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EbookController extends GetxController {
  List ebookList = [
    {
      "id": 1,
      "name": "E-Book",
      "price": 200,
      "des":
          "The Most Relevant information. 100% Privacy Protected! Find what you are looking for Here. 99% Match on Your Search Query. Only relevant search results, Click here and Find. Discover us now! Easy Acces To Information. Simple in use. Multiple sources combined.",
      "img":
          "https://1.bp.blogspot.com/-GzyXtAWGohc/YIZXKd677gI/AAAAAAAABp4/odv9oe3is4YvJoyVFPuf5iZE7gkoA6wNgCLcBGAsYHQ/s1280/20210426_115845.jpg"
    },
    {
      "id": 2,
      "name": "E-Book",
      "price": 200,
      "des":
          "The Most Relevant information. 100% Privacy Protected! Find what you are looking for Here. 99% Match on Your Search Query. Only relevant search results, Click here and Find. Discover us now! Easy Acces To Information. Simple in use. Multiple sources combined.",
      "img":
          "https://1.bp.blogspot.com/-GzyXtAWGohc/YIZXKd677gI/AAAAAAAABp4/odv9oe3is4YvJoyVFPuf5iZE7gkoA6wNgCLcBGAsYHQ/s1280/20210426_115845.jpg"
    },
    {
      "id": 3,
      "name": "E-Book",
      "price": 200,
      "des":
          "The Most Relevant information. 100% Privacy Protected! Find what you are looking for Here. 99% Match on Your Search Query. Only relevant search results, Click here and Find. Discover us now! Easy Acces To Information. Simple in use. Multiple sources combined.",
      "img":
          "https://1.bp.blogspot.com/-GzyXtAWGohc/YIZXKd677gI/AAAAAAAABp4/odv9oe3is4YvJoyVFPuf5iZE7gkoA6wNgCLcBGAsYHQ/s1280/20210426_115845.jpg",
    },
    {
      "id": 4,
      "name": "E-Book",
      "price": 200,
      "des":
          "The Most Relevant information. 100% Privacy Protected! Find what you are looking for Here. 99% Match on Your Search Query. Only relevant search results, Click here and Find. Discover us now! Easy Acces To Information. Simple in use. Multiple sources combined.",
      "img":
          "https://1.bp.blogspot.com/-GzyXtAWGohc/YIZXKd677gI/AAAAAAAABp4/odv9oe3is4YvJoyVFPuf5iZE7gkoA6wNgCLcBGAsYHQ/s1280/20210426_115845.jpg"
    }
  ].obs;

  var _products = {}.obs;
  var ebook = [].obs;
  get elist => ebook;

  addProduct(product) {
    ebook.add(product);

    Get.snackbar("Add Product", "Successfully ",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 10));
  }

  // Recieve Book data
  List<CartModel> recieveBookList = <CartModel>[].obs;

  recieveBook(int id, String name, String img, int price, var payment) {
    CartModel recieveList =
        CartModel(id: id, name: name, img: img, price: price, payment: payment);

    recieveBookList.add(recieveList);
    return recieveBookList;
  }
}

class CartModel {
  final int id;
  final String name;
  final String img;
  final int price;
  final String payment;

  CartModel(
      {required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.payment});
}
