import 'dart:math';

import 'package:flutter/material.dart';

class ProductGroup {
  int id;
  String name;
  int productCount;
  String imageUrl;

  ProductGroup(
      {required this.id,
      required this.name,
      required this.productCount,
      required this.imageUrl});

  static ProductGroup GetFromJson(Map<String, dynamic> json) {
    return ProductGroup(
        id: json["id"],
        name: json["name"],
        productCount: json["productCount"],
        imageUrl: json["imageUrl"]);
  }

  static List<ProductGroup> GeneratePseudoData() {
    return List<ProductGroup>.generate(10, (index) {
      return ProductGroup.GetFromJson({
        "id": index,
        "name": "Group" + index.toString(),
        "productCount": Random().nextInt(10) + 2,
        "imageUrl":
            "https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JvY2VyeXxlbnwwfHwwfHw%3D&w=1000&q=80"
      });
    });
  }
}
