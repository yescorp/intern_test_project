import 'Product.dart';

class OrderItem{
  Product product;
  int count;

  OrderItem({required this.product, required this.count});

  static GetFromJson(Map<String, dynamic> json) {
    return OrderItem(product: json["product"], count: json["count"]);
  }
}