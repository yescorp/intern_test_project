import 'package:flutter/material.dart';
import 'package:intern_test_project/Models/ProductGroup.dart';

class ProductGroupItem extends StatelessWidget {
  final ProductGroup group;

  const ProductGroupItem({required this.group, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 248, 248, 248)),
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.width * 0.42,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/products-list-page", arguments: {"product-group" : group});
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image.network(group.imageUrl),
              const SizedBox(height: 12,),
              Row(
                children: [
                  Expanded(child: Text(group.name)),
                  Text(group.productCount.toString() + " " + "шт.")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
