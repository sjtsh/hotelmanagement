import 'package:flutter/material.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:provider/provider.dart';

import '../../Models/Cart.dart';
import '../../global.dart';
import '../Header/Header.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Cart> cartList = context.read<Datamanagement>().cartItems;

    int totalAmount = 0;
    int totalQuantity =0;


    cartList.forEach((element) {
      totalAmount = (totalAmount + element.rate!*element.quantity!);

      totalQuantity = totalQuantity + element.quantity!;

    });



    // List<Cart> FilteredcartList =  cartList.where((element) {
    //
    //
    //  return element.id == element.id;

   // } ).toList();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Header(
            context: context,
            width: width,
            title: "Cart",
            lefticon: true,
            rightIcon: false,
          ),
          if (cartList.length == 0) Expanded(
                  child: Container(
                    child: Center(child: Text("No items in cart")),
                  ),
                ) else Column(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.1)),
                      height: height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 12,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                [
                                  "Total Items",
                                  "$totalQuantity"
                                ],
                                ["Discount", "0"],
                                ["Total amount:", "$totalAmount"],

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
                                                color: Colors.grey))
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
                            Spacer(),
                            TextButton(  onPressed: () {  },
                            child: Text("Confirm Order >>"),)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.70,
                      child: ListView.builder(itemCount: cartList.length,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
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
                            child: Center(
                              child: ListTile(
                                leading: SizedBox(


                                    child: Image.network(
                                      "$localhost${cartList[index].Image!}",
                                      fit: BoxFit.cover,
                                    )),
                                title: Row(
                                  children: [
                                    Text(cartList[index].name!, style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(" (FD${cartList[index].id!.toString()})", style:TextStyle(fontSize: 12) ,)
                                  ],
                                ),
                                subtitle:
                                    Text("${cartList[index].quantity!.toString()}"),
                                trailing: Text("Rs.${cartList[index].rate! * cartList[index].quantity!}"),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
