import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intern_test_project/Pages/Basket/SingleBasketItem.dart';

import 'package:intern_test_project/AppData.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {

    if(AppData.of(context)
        .basket.isEmpty){
      totalPrice = 0;
    }
    else{
      totalPrice = AppData.of(context)
          .basket
          .map((e) => e.price)
          .reduce((value, element) => value + element);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish Swish"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.totalPrice,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: Text(totalPrice.toString(),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "₽",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SingleBasketItem(
                        product: AppData.of(context).basket[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: AppData.of(context).basket.length),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            AppData.of(context).orderCurrentBasket();
                          },
                          child: Text(
                              AppLocalizations.of(context)!.payButtonText))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
