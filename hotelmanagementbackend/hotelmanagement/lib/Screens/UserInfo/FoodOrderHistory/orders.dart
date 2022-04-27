import 'package:flutter/material.dart';
import 'package:hotelmanagement/Components/orderRatingDialog.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:provider/provider.dart';

import '../../../Components/ratingDialog.dart';
import '../../../Models/Food.dart';
import '../../../StateManager/Datamanagement.dart';
import '../../../global.dart';
import '../../Header/Header.dart';

class FoodOrders extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                print(e.rating);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      _showMyDialog(context,width, e.id, );
                    },
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
                            Text( e.rating == null ? "Rating: 0" :"Rating: ${e.rating.toString()}"),
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
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
  Future<void> _showMyDialog(context, width, orderId,) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return RatingDialogOrder(orderId, width);
      },
    );
  }
}
