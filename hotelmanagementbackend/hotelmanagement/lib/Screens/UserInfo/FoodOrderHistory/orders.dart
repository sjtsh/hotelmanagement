

import 'package:flutter/material.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:provider/provider.dart';

import '../../../Models/Food.dart';
import '../../../StateManager/Datamanagement.dart';
import '../../../global.dart';
import '../../Header/Header.dart';

class FoodOrders extends StatelessWidget {
  const FoodOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <Food> orders = [];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    for(int i =0 ; i< context.read<Datamanagement>().orderbookings.length;i ++) {
      context
          .read<Datamanagement>()
          .orderbookings[i].itemsIterable.forEach((key, value) {

              orders.add(key);


            print(orders.length);
      });
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Header(
            context: context,
            width: width,
            title: "MyOrders",
            lefticon: true,
            rightIcon: false,
          ),

          Expanded(
            child: ListView.builder(
              itemCount:orders.length,
              itemBuilder: (BuildContext context, int index) {

               return
                Padding(
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
                    width: width,
                    child: Row(
                      children: [
                        Image.network("${localhost} ${orders[index].img}",height: 70, width: 70,),
                        SizedBox(width: 12,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(orders[index].name.toString()),
                            Text(orders[index].cost.toString()),
                          ],
                        ),

                        SizedBox(width: 12,),



                      ],
                    ),



                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
