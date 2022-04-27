import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotelmanagement/Services/BookingService.dart';
import 'package:provider/provider.dart';

import '../Services/FoodService.dart';

class RatingDialogOrder extends StatelessWidget {
  int orderId;

  double width;
  RatingDialogOrder(this.orderId, this.width);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
            color: Colors.transparent,
            child: Container(
                decoration: ShapeDecoration(
                  color: const Color(0xffF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: SizedBox(
                  height: 200,
                  width: width*0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close_rounded,
                                color: Colors.red,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6,),
                        const Text(
                          "Please share your experiences",
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12,),
                        const Text(
                          "Would you like to give rating?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 24,),
                        RatingBar.builder(
                          itemSize: 30,
                          itemBuilder:
                              (BuildContext context, int index) =>
                          const Icon(Icons.star,
                              color: Colors.amber),
                          onRatingUpdate: (double value) {
                            int va = value.toInt();
                            FoodService()
                                .rateOrder(orderId, va).then((value) {
                              if (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: const Text("Thank you")));
                                Navigator.pop(context);
                              }else{
                                Navigator.pop(context);
                              }

                            });
                          },
                        ),
                        const SizedBox(height: 24,),

                      ],
                    ),
                  ),
                ))));
  }
}
