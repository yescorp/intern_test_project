import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_test_project/Models/Product.dart';

import 'package:intern_test_project/AppData.dart';

class SingleBasketItem extends StatelessWidget {
  final Product product;

  const SingleBasketItem({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl,
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width - 200,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text(product.name),
                      SvgPicture.asset("lib/assets/star-icon.svg"),
                      Expanded(child: Text(product.rating.toStringAsPrecision(2)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text(product.price.toString()),
                      SizedBox(
                        width: 5,
                      ),
                      Text(product.currency)
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(child: IconButton(
              onPressed: (){
                AppData.of(context).RemoveFromCart(product);
              },
              icon: SvgPicture.asset("lib/assets/trash-icon.svg", width: 80,))),
        ],
      ),
    );
  }
}
