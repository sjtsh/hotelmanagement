import 'package:flutter/material.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:hotelmanagement/Services/FoodService.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:provider/provider.dart';

import '../../../Models/Food.dart';
import '../../../global.dart';
import '../../Header/Header.dart';
import '../Billing/BillingSceen.dart';


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
    Map<int, int> cartList = context.read<Datamanagement>().cartItems;

    int totalAmount = 0;
    int totalQuantity = 0;

    cartList.entries.forEach((element) {
      Food food = context
          .read<Datamanagement>()
          .allFoods
          .firstWhere((a) => element.key == a.id);
      totalAmount += food.cost * element.value;

      totalQuantity += element.value;
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
          if (cartList.length == 0)
            Expanded(
              child: Container(
                child: Center(child: Text("No items in cart")),
              ),
            )
          else
            Column(
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
                        SizedBox(
                          height: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ["Total Items", "$totalQuantity"],
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(child: Container()),
                                        Text(e[1].toString(),
                                            style:
                                                TextStyle(color: Colors.grey))
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
                        TextButton(
                          onPressed: () {
                            FoodService().createOrder(userID, cartList).then((value) {
                              if(value!=null){
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Order confirmed")));

                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BillingScreen(value)));
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to order")));
                              }


                            });
                            // FoodService().getOrders(userID);


                          },
                          child: Text("Confirm Order >>"),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.70,
                  child: ListView(
                      children: cartList.entries.map((element) {
                    Food food = context
                        .read<Datamanagement>()
                        .allFoods
                        .firstWhere((a) => element.key == a.id);
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
                              "$localhost${food.img}",
                              fit: BoxFit.cover,
                                  width: 70,
                            )),
                            title: Row(
                              children: [
                                Text(
                                  food.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " (FD${food.id.toString()})",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            subtitle: Text("${element.value.toString()}  (Rs. ${food.cost}) = Rs.${food.cost * element.value}"),
                            trailing: IconButton(onPressed: (){
                              cartList.remove(food.id);
                              setState(() {

                              });
                            }, icon: Icon(Icons.delete_forever_outlined, color: Colors.red,)),
                          ),
                        ),
                      ),
                    );
                  }).toList()),
                ),
              ],
            )
        ],
      ),
    );
  }
}
