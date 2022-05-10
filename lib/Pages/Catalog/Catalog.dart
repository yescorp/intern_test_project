import 'package:flutter/material.dart';
import 'package:intern_test_project/AppData.dart';
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
    AppData.of(context).testConnection();

    if(AppData.of(context).productGroupsCache.isEmpty){
      finalGroups =
          Future.delayed(const Duration(seconds: 2), () {
            return ProductGroup.GeneratePseudoData();
          });
      finalGroups?.then((value) => AppData.of(context).updateProductGroup(value));
    }
    else {
      finalGroups =
          Future.delayed(const Duration(milliseconds: 0), () {
            return AppData.of(context).productGroupsCache;
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppData.of(context).appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.catalog, textAlign: TextAlign.start, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: finalGroups,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductGroup>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    List<ProductGroupItem> groups = [];

                    for (int i = 0; i < snapshot.data!.length; i++) {
                      groups.add(ProductGroupItem(
                          group: snapshot.data![i],));
                    }

                    return GridView.count(crossAxisCount: 2, children: groups, physics: const NeverScrollableScrollPhysics(), shrinkWrap: true,);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
