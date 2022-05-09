import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_test_project/Models/Product.dart';

import 'package:intern_test_project/AppData.dart';

class SingleProduct extends StatelessWidget {
  final Product product;

  const SingleProduct({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black12),
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
                      Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      const SizedBox(width: 5,),
                      SvgPicture.asset("lib/assets/star-icon.svg"),
                      const SizedBox(width: 5,),
                      Expanded(child: Text(product.rating.toStringAsPrecision(2), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),))
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text(product.price.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(product.currency, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(child: IconButton(
              onPressed: (){
                AppData.of(context).addToCart(product);
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/cart");
              },
              icon: SvgPicture.asset("lib/assets/shopping-cart-icon.svg", width: 80,))),
        ],
      ),
    );
  }
}
