import 'package:intern_test_project/Models/OrderItem.dart';

import 'Product.dart';

class Order{
  int id;
  int number;
  double totalPrice;
  DateTime orderDate;
  List<Product> orderItems;
  static int idGenerator = 0;

  Order({required this.id, required this.number, required this.totalPrice, required this.orderDate, required this.orderItems});

  static Order GetFromJson(Map<String, dynamic> json){
    List<Product> items = [];
    for(int i = 0; i < json["orderItems"].length; i++){
      items.add(Product.GetFromJson(json["orderItems"][i]));
    }

    return Order(id: json["id"], number: json["number"], totalPrice: json["totalPrice"], orderDate: json["orderDate"], orderItems: items);
  }
}