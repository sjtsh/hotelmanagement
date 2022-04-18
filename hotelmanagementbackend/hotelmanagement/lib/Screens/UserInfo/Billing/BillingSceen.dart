import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:provider/provider.dart';

import '../../../Models/Food.dart';
import '../../../Services/FoodService.dart';
import '../../../StateManager/Datamanagement.dart';
import '../../Header/Header.dart';

class BillingScreen extends StatelessWidget {
  List<OrderBooking> orderBooking;

  BillingScreen(this.orderBooking);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map<int, int> cartList = context.read<Datamanagement>().cartItems;

    int totalAmount = 0;
    int totalQuantity = 0;
    int? orderbookingId = orderBooking[0].id;
    String? orderbookingDate =
        orderBooking[0].created.toString().substring(0, 19);
    double? rateValue = orderBooking[0].rating?.toDouble();

    cartList.entries.forEach((element) {
      Food food = context
          .read<Datamanagement>()
          .allFoods
          .firstWhere((a) => element.key == a.id);
      totalAmount += food.cost * element.value;

      totalQuantity += element.value;
    });
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Header(
            context: context,
            width: width,
            title: "Bills",
            lefticon: false,
            rightIcon: false,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order ID: $orderbookingId"),
                const SizedBox(
                  height: 12,
                ),
                Text("Order at: $orderbookingDate"),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Foods",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "quantity",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "cost",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )
                  ],
                ),
                ListView(
                    shrinkWrap: true,
                    children: cartList.entries.map((element) {
                      Food food = context
                          .read<Datamanagement>()
                          .allFoods
                          .firstWhere((a) => element.key == a.id);
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(food.name),
                                  Text("${element.value.toString()} "),
                                  Text("Rs. ${food.cost}")
                                ]),
                          ));
                    }).toList()),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  height: 2,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 60,
                    ),
                    const Text("Total cost"),
                    Text(
                      "Rs.$totalAmount",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Thank you for your order.",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const Text("Please share your experience."),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: RatingBar.builder(
                        itemSize: 24,
                        onRatingUpdate: (double value) {
                          int va = value.toInt();
                          FoodService()
                              .rateOrder(orderbookingId!, va)
                              .then((lue) {
                            if (lue) {
                              context.read<Datamanagement>().cartItems = {};
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: const Text("Thank you")));
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          });
                        },
                        itemBuilder: (BuildContext context, int index) =>
                            const Icon(Icons.star, color: Colors.amber),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    MaterialButton(
                      height: 60,
                      minWidth: 100,
                      color: Colors.grey,
                      onPressed: () {
                        context.read<Datamanagement>().cartItems = {};

                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text("Close", style: TextStyle(color: Colors.white),),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
