

import 'package:flutter/material.dart';

import '../Header/Header.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Column(
        children: [
          SizedBox(height: 24,),
          Header(
            context: context,
            width: width,
            title: "Bills",
            lefticon: false,
            rightIcon: false,
          ),

          Column(
            children: [
              Text("Order"),
              Text("Order at"),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    [
                      "Lasanga",

                      "1",
                      "450"
                    ],
                    ["MOMO", "2" ,"350"],
                    ["Coffee", " 4" ,"22"],
                  ]
                      .map(
                        (e) => Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              e[0].toString(),
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight.bold),
                            ),
                            Expanded(child: Container()),
                            Text(e[1].toString(),
                                style: TextStyle(
                                    color: Colors.grey)),
                            Expanded(child: Container()),
                            Text(e[2].toString(),
                                style: TextStyle(
                                    color: Colors.grey)),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
