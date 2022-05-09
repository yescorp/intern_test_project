import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intern_test_project/Models/Order.dart';

import '../../AppData.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.hollywoodreporter.com/wp-content/uploads/2019/03/avatar-publicity_still-h_2019.jpg?w=1024"),
                    radius: 60,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Естай \nТастанов",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                AppLocalizations.of(context)!.orderHistoryHeaderText,
                textAlign: TextAlign.start,
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 246, 246, 246)),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: AppData.of(context).orders.length,
                    itemBuilder: (context, index) {
                      Order order = AppData.of(context).orders[index];
                      return Row(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Заказ #" + order.number.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                                        child: Text(
                                      order.totalPrice.toString() + "\t₽",
                                      textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ))
                                  ],
                                ),
                              ),
                              ListView.builder(
                                  itemExtent: 50,
                                  itemCount: order.orderItems.length,
                                  itemBuilder: (context, i) {
                                    return Row(
                                      children: [
                                        Text(order.orderItems[i].name),
                                        Expanded(
                                            child: Text(
                                          order.orderItems[i].price.toString()+ "\t₽",
                                          textAlign: TextAlign.end,
                                        ))
                                      ],
                                    );
                                  })
                            ],
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
     */
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.hollywoodreporter.com/wp-content/uploads/2019/03/avatar-publicity_still-h_2019.jpg?w=1024"),
                      radius: 60,
                    ),
                    SizedBox(width: 15,),
                    Expanded(child: Text("Естай \nТастанов", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),))

                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(AppLocalizations.of(context)!.orderHistoryHeaderText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: AppData.of(context).orders.length,
                          itemBuilder: (BuildContext context, int index1) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(246, 246, 246, 1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 15),
                                          child: Text(
                                            'Заказ №' +
                                                AppData.of(context)
                                                    .orders[index1]
                                                    .number
                                                    .toString(),
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )),
                                        Text(
                                          AppData.of(context)
                                                  .orders[index1]
                                                  .totalPrice
                                                  .toString() +
                                              ' ₽',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: AppData.of(context)
                                            .orders[index1]
                                            .orderItems
                                            .length,
                                        itemBuilder:
                                            (BuildContext context, int index2) {
                                          return Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                                  child: Text(
                                                    AppData.of(context)
                                                        .orders[index1]
                                                        .orderItems[index2]
                                                        .name
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                AppData.of(context)
                                                        .orders[index1]
                                                        .orderItems[index2]
                                                        .price
                                                        .toString() +
                                                    ' ₽',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          );
                                        })
                                  ],
                                ),
                              ),
                            );
                          })
                    ])
              ],
            )),
      ),
    );
  }
}
