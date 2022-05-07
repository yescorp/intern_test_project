import 'package:flutter/material.dart';
import 'package:intern_test_project/Models/Order.dart';

import 'Models/Product.dart';
import 'Models/User.dart';

class AppDataWidget extends StatefulWidget {
  final Widget child;

  const AppDataWidget({Key? key, required this.child}) : super(key: key);

  @override
  _AppDataState createState() => _AppDataState();
}

class _AppDataState extends State<AppDataWidget> {
  final List<Product> basket = [];
  final List<Order> orders = [];
  final User user = User(id: 0, name: "", surname: "", avatar: "");
  
  @override
  Widget build(BuildContext context) {
    return AppData(child: widget.child, state: this);
  }
}

class AppData extends InheritedWidget{
  final _AppDataState state;

  static _AppDataState of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppData>()!.state;

  const AppData({Key? key, required Widget child, required this.state}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
  
}