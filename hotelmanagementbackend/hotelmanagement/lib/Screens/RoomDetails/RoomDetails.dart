import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotelmanagement/Models/RoomBooking.dart';
import 'package:hotelmanagement/Services/BookingService.dart';
import 'package:hotelmanagement/Services/FoodService.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:provider/provider.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';

import '../../Models/Food.dart';
import '../../Models/Room.dart';
import '../Header/Header.dart';

class RoomDetails extends StatefulWidget {
  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  TextEditingController  textController = TextEditingController();
  ScrollController controller = ScrollController();

  Room? selectedRoom;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double ? rateValue = selectedRoom?.averageRating?.toDouble();

    return FutureBuilder(
        future: BookingService().getRooms(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            context.read<Datamanagement>().allRooms = snapshot.data;
            return Scaffold(
              body: ListView(
                controller: controller,
                children: [
                  selectedRoom == null
                      ? Container()
                      : Header(
                          context: context,
                          width: width,
                          title: selectedRoom!.type,
                          lefticon: false,
                          rightIcon: false,
                        ),
                  selectedRoom == null
                      ? Container()
                      : SizedBox(
                          height: 10,
                        ),
                  selectedRoom == null
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
                  selectedRoom == null
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
                                  Text(
                                    "Average User Rating",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(child: Container()),
                                  RatingBar.builder(
                                    itemSize: 24,
                                    initialRating: rateValue ?? 0.0 ,
                                    onRatingUpdate: (double value) {
                                      int va = value.toInt();
                                      // FoodService().rateOrder(selectedRoom!.id, va);
                                    print(selectedRoom!.id);
                                      setState(() {});
                                    },
                                    itemBuilder: (BuildContext context,
                                            int index) =>
                                        Icon(Icons.star, color: Colors.amber),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  [
                                    "ID",
                                    "#FD${selectedRoom!.id.toString().padLeft(4, "0")}"
                                  ],
                                  ["Name", selectedRoom!.type],
                                  ["Amount", selectedRoom!.cost.toString()],
                                  [
                                    "In Stock",
                                    selectedRoom!.available == true
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
                                    onPressed: () {
                                    },
                                    child: Center(
                                      child: Text(
                                        "Book",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                  selectedRoom == null
                      ? Container()
                      : Row(
                          children: [
                            Expanded(child: Container()),
                            IconButton(
                                onPressed: () {
                                  selectedRoom = null;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 16,
                                )),
                          ],
                        ),
                  selectedRoom == null
                      ? Container()
                      : Divider(
                          height: 2,
                          thickness: 2,
                        ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Other Rooms",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 16 +
                        (context.watch<Datamanagement>().allRooms.length % 2 ==
                                    0
                                ? context
                                        .watch<Datamanagement>()
                                        .allRooms
                                        .length ~/
                                    2
                                : context
                                            .watch<Datamanagement>()
                                            .allRooms
                                            .length ~/
                                        2 +
                                    1) *
                            200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Builder(builder: (context) {
                        List<Room> filteredFood = context
                            .watch<Datamanagement>()
                            .allRooms
                            .where((element) =>
                                element.id != (selectedRoom?.id ?? 0))
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
                                      selectedRoom = filteredFood[i];
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
