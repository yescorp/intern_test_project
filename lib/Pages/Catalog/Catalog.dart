import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_test_project/AppData.dart';
import 'package:intern_test_project/Models/Product.dart';
import 'package:intern_test_project/Models/ProductGroup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intern_test_project/Pages/Catalog/ProductGroupItem.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  Future<List<ProductGroup>>? finalGroups;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(AppData.of(context).productGroupsCache.isEmpty){
      finalGroups =
          Future.delayed(Duration(seconds: 2), () {
            return ProductGroup.GeneratePseudoData();
          });
      finalGroups?.then((value) => AppData.of(context).UpdateProductGroup(value));
    }
    else {
      finalGroups =
          Future.delayed(Duration(milliseconds: 0), () {
            return AppData.of(context).productGroupsCache;
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Wish Swish"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.catalog, textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: finalGroups,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductGroup>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    List<ProductGroupItem> groups = [];

                    for (int i = 0; i < snapshot.data!.length; i++) {
                      groups.add(ProductGroupItem(
                          imageUrl: snapshot.data![i].imageUrl,
                          name: snapshot.data![i].name,
                          count: snapshot.data![i].productCount));
                    }

                    return GridView.count(crossAxisCount: 2, children: groups, physics: NeverScrollableScrollPhysics(), shrinkWrap: true,);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
