import 'dart:math';

import 'package:intern_test_project/Models/ProductGroup.dart';

class Product {
  int id;
  int groupId;
  String name;
  double rating;
  double price;
  String imageUrl;
  String currency;

  Product(
      {required this.id,
      required this.groupId,
      required this.name,
      required this.rating,
      required this.price,
      required this.imageUrl,
      required this.currency});

  static Product GetFromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        groupId: json["groupId"],
        name: json["name"],
        rating: json["rating"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        currency:  json["currency"]);
  }

  static GeneratePseudoData(ProductGroup group){
    return List<Product>.generate(group.productCount, (index) {
      return Product.GetFromJson({
        "id": index,
        "groupId" : group.id,
        "name": "product " + index.toString(),
        "rating": Random().nextDouble() * 5,
        "price": Random().nextInt(100) * 100.0,
        "imageUrl": "https://offautan-uc1.azureedge.net/-/media/images/off/ph/products-en/products-landing/landing/off_softscented_product_collections_large_2x.jpg?la=en-ph",
        "currency": "₽"
      });
    });
  }
}
