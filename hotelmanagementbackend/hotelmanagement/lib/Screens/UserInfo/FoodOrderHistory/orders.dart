import 'package:flutter/material.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:provider/provider.dart';

import '../../../Models/Food.dart';
import '../../../StateManager/Datamanagement.dart';
import '../../../global.dart';
import '../../Header/Header.dart';

class FoodOrders extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Header(
            context: context,
            title: "MyOrders",
            lefticon: true,
            rightIcon: false,
          ),
          Expanded(
            child: ListView(
              children: context.read<Datamanagement>().orderbookings.map((e) {
                counter++;
                print(e.id);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.3))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.created.toString().substring(0, 19),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Order ID: ${e.id.toString()}"),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: e.itemsIterable.entries
                                    .map(
                                      (f) => Row(
                                        children: [
                                          Text(f.key.name),
                                          Expanded(child: Container()),
                                          Text(f.value.toString()),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
