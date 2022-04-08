import 'package:flutter/material.dart';
import 'package:hotelmanagement/Services/FoodService.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:provider/provider.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';

import '../../Models/Food.dart';
import '../Header/Header.dart';

class FoodDetails extends StatefulWidget {
  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  ScrollController controller = ScrollController();

  Food? selectedFood;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: FoodService().getFoods(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            context.read<Datamanagement>().allFoods = snapshot.data;
            return Scaffold(
              body: ListView(
                controller: controller,
                children: [
                  SizedBox(
                    height: 24,
                  ),
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
                      : SizedBox(
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
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAZ3ZOah8ngfrECbPdGo3cOowfNY6y4LUUHg&usqp=CAU",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  selectedFood == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Average User Rating",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(child: Container()),
                                  Text("star",
                                      style: TextStyle(color: Colors.grey))
                                ],
                              ),
                              SizedBox(
                                height: 6,
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
                              Container(
                                height: 50,
                                width: width / 2,
                                child: TextFormField(
                                  onTap: () {},
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(16),
                                    hintText: "Pcs",
                                    fillColor: Color(0xffF3F3F3),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
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
                                    onPressed: () {},
                                    child: Center(
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
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 16,
                                )),
                          ],
                        ),
                  selectedFood == null
                      ? Container()
                      : Divider(
                          height: 2,
                          thickness: 2,
                        ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Other Foods",
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
                            physics: NeverScrollableScrollPhysics(),
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
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeIn);
                                      selectedFood = filteredFood[i];
                                      setState(() {});
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Image.network(
                                        "https://tpc.googlesyndication.com/daca_images/simgad/6055137103827894578",
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
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: Radius.circular(8)),
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
                                                TextStyle(color: Colors.white),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
