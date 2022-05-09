import 'package:flutter/material.dart';

class ProductGroupItem extends StatelessWidget {
  String imageUrl;
  String name;
  int count;

  ProductGroupItem({required this.imageUrl, required this.name, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 248, 248, 248)),
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.width * 0.42,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Image.network(imageUrl),
            SizedBox(height: 12,),
            Row(
              children: [
                Expanded(child: Text(name)),
                Text(count.toString() + " " + "шт.")
              ],
            )
          ],
        ),
      ),
    );
  }
}
