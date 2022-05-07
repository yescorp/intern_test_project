import 'package:flutter/material.dart';

class ProductGroup{
  int id;
  String name;
  int productCount;
  String imageUrl;

  ProductGroup({required this.id, required this.name, required this.productCount, required this.imageUrl});

  static ProductGroup GetFromJson(Map<String, dynamic> json){
    return ProductGroup(id: json["id"], name: json["name"], productCount: json["productCount"], imageUrl: json["imageUrl"]);
  }
}