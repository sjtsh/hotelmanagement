import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotelmanagement/Models/Cart.dart';
import 'package:hotelmanagement/Services/FoodService.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/global.dart';
import 'package:provider/provider.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';

import '../../Models/Food.dart';
import '../Header/Header.dart';

class FoodDetails extends StatefulWidget {
  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  TextEditingController textController = TextEditingController();
  ScrollController controller = ScrollController();

  Food? selectedFood;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double? rateValue = selectedFood?.rating?.toDouble();

    return FutureBuilder(
        future: FoodService().getFoods(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            context.read<Datamanagement>().allFoods = snapshot.data;
            return Scaffold(
              body: ListView(
                controller: controller,
                children: [
                  selectedFood == null
                      ? Container()
                      : Header(
                          context: context,
                          width: width,
                          title: selectedFood!.name,
                          lefticon: false,
                          rightIcon: false,
                        ),
                  selectedFood == null
                      ? Container()
                      : const SizedBox(
                          height: 10,
                        ),
                  selectedFood == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 300,
                            width: width,
                            child: Image.network(
                              "${localhost}${selectedFood!.img}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  selectedFood == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            right: 16,
                            left: 16,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Average User Rating",
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(child: Container()),
                                  RatingBar.builder(
                                    itemSize: 24,
                                    initialRating: rateValue ?? 0.0,
                                    onRatingUpdate: (double value) {
                                      int va = value.toInt();
                                      // FoodService().rateOrder(selectedFood!.id, va);
                                      print(selectedFood!.id);
                                      setState(() {});
                                    },
                                    itemBuilder: (BuildContext context,
                                            int index) =>
                                        const Icon(Icons.star, color: Colors.amber),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  [
                                    "ID",
                                    "#FD${selectedFood!.id.toString().padLeft(4, "0")}"
                                  ],
                                  ["Name", selectedFood!.name],
                                  ["Amount", selectedFood!.cost.toString()],
                                  [
                                    "In Stock",
                                    selectedFood!.inStock == true
                                        ? "Available"
                                        : "Out of stock"
                                  ],
                                ]
                                    .map(
                                      (e) => Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                e[0].toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Expanded(child: Container()),
                                              Text(e[1].toString(),
                                                  style: const TextStyle(
                                                      color: Colors.grey))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                              Container(
                                height: 50,
                                width: width / 2,
                                child: TextFormField(
                                  controller: textController,
                                  keyboardType: TextInputType.number ,
                                  onTap: () {},
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(16),
                                    hintText: "Pcs",
                                    fillColor: const Color(0xffF3F3F3),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: width / 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.green),
                                  child: MaterialButton(
                                    splashColor: Colors.transparent,
                                    height: 40,
                                    onPressed: () {
                                      if (textController.text.isNotEmpty) {
                                        context.read<Datamanagement>().cartItems.
                                        add(Cart(
                                            id: selectedFood!.id,
                                            Image: selectedFood!.img,
                                            name: selectedFood!.name,

                                            quantity: int.parse(
                                                textController.text,),
                                        rate: selectedFood!.cost));
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to cart")));
                                        textController.text = "";
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Please provide quantity")));
                                      }
                                    },
                                    child: const Center(
                                      child: Text(
                                        "Add to cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                  selectedFood == null
                      ? Container()
                      : Row(
                          children: [
                            Expanded(child: Container()),
                            IconButton(
                                onPressed: () {
                                  selectedFood = null;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 16,
                                )),
                          ],
                        ),
                  selectedFood == null
                      ? Container()
                      : const Divider(
                          height: 2,
                          thickness: 2,
                        ),
                   Padding(
                    padding: EdgeInsets.all(12.0),
                    child: selectedFood == null
                        ?  Text("Foods",
                        style: TextStyle(fontWeight: FontWeight.bold)) :  Text("Other Foods",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 16 +
                        (context.watch<Datamanagement>().allFoods.length % 2 ==
                                    0
                                ? context
                                        .watch<Datamanagement>()
                                        .allFoods
                                        .length ~/
                                    2
                                : context
                                            .watch<Datamanagement>()
                                            .allFoods
                                            .length ~/
                                        2 +
                                    1) *
                            200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Builder(builder: (context) {
                        List<Food> filteredFood = context
                            .watch<Datamanagement>()
                            .allFoods
                            .where((element) =>
                                element.id != (selectedFood?.id ?? 0))
                            .toList();
                        return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: filteredFood.length,
                            itemBuilder: (BuildContext ctx, i) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      //TODO : jkhaf ahdf

                                      // controller.jumpTo(0);
                                      controller.animateTo(0,
                                          duration: const Duration(milliseconds: 200),
                                          curve: Curves.easeIn);
                                      selectedFood = filteredFood[i];
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.network(
                                        "${localhost}${filteredFood[i].img}",
                                        fit: BoxFit.cover,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 16,
                                      right: 0,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: const Radius.circular(8)),
                                            color: Colors.green),
                                        height: 20,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2,
                                              bottom: 2,
                                              right: 8,
                                              left: 12),
                                          child: Center(
                                              child: Text(
                                            filteredFood[i].cost.toString(),
                                            style:
                                                const TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ))
                                ],
                              );
                            });
                      }),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: const CircularProgressIndicator(),
          );
        });
  }
}
