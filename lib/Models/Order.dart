import 'package:intern_test_project/Models/OrderItem.dart';

class Order{
  int id;
  int number;
  double totalPrice;
  DateTime orderDate;
  List<OrderItem> orderItems;

  Order({required this.id, required this.number, required this.totalPrice, required this.orderDate, required this.orderItems});

  static Order GetFromJson(Map<String, dynamic> json){
    List<OrderItem> items = [];
    for(int i = 0; i < json["orderItems"].length; i++){
      items.add(OrderItem.GetFromJson(json["orderItems"][i]));
    }

    return Order(id: json["id"], number: json["number"], totalPrice: json["totalPrice"], orderDate: json["orderDate"], orderItems: items);
  }
}