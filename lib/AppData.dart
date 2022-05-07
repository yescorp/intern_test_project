import 'package:flutter/material.dart';
import 'package:intern_test_project/Models/Order.dart';

import 'Models/Product.dart';
import 'Models/User.dart';

class StateInheritedWidget extends InheritedWidget{
  final List<Product> basket = [];
  final List<Order> orders = [];
  final User user = User(id: 0, name: "", surname: "", avatar: "");


  StateInheritedWidget({Key? key, required Widget child,}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
  
}