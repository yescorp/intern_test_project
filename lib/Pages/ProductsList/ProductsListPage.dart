import 'package:flutter/material.dart';
import 'package:intern_test_project/Models/Product.dart';
import 'package:intern_test_project/Models/ProductGroup.dart';
import 'package:intern_test_project/Pages/ProductsList/SingleProduct.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  _ProductsListPageState createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = Map<String, dynamic>.from(
        ModalRoute.of(context)?.settings.arguments as Map);

    Future<List<Product>> d = Future.delayed(const Duration(seconds: 1), () {
      return Product.GeneratePseudoData(args["product-group"]);
    });

    return Scaffold(
      appBar: AppBar(title: Text((args["product-group"] as ProductGroup).name),),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
        future: d,
        builder:
            (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<SingleProduct> list = snapshot.data!.map((e) => SingleProduct(product: e)).toList();

          return ListView.builder(
            shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    SizedBox(
                        height: 100,
                        child: list[index]),
                    const SizedBox(height: 5,)
                  ],
                );
          });
        },
      ),
    );
  }
}
