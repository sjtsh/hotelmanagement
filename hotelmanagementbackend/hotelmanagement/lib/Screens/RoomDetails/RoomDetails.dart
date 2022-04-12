import 'package:carousel_slider/carousel_slider.dart';
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
import '../../global.dart';
import '../Header/Header.dart';

class RoomDetails extends StatefulWidget {
  int index;

  RoomDetails(this.index);

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  TextEditingController textController = TextEditingController();
  ScrollController controller = ScrollController();

  Room? selectedRoom;
  DateTimeRange? _selectedDateRange;


  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      setState(() {
        _selectedDateRange = result;
      });
    }
  }

  _bookRoom(int userid, int roomId, DateTime start, DateTime end) {
    BookingService().createBooking(userid, roomId, start, end);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double? rateValue = selectedRoom?.averageRating?.toDouble();

    List<Room> filteredRoom = context
        .watch<Datamanagement>()
        .allRooms
        .where((element) => element.id != (selectedRoom?.id ?? 0))
        .toList();
    selectedRoom = filteredRoom[widget.index];
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
                  lefticon: true,
                  rightIcon: false,
                ),
          selectedRoom == null
              ? Container()
              : const SizedBox(
                  height: 10,
                ),
          selectedRoom == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 90,
                        right: 2,
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                      const Positioned(
                        top: 90,
                        left: 5,
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      CarouselSlider.builder(
                        itemCount: context
                            .read<Datamanagement>()
                            .allRooms[widget.index]
                            .image
                            .length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          height: 300,
                          width: width,
                          child: Image.network(
                            "${localhost}${context.read<Datamanagement>().allRooms[widget.index].image[itemIndex]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 0.9,
                          aspectRatio: 2.0,
                          initialPage: 1,
                        ),
                      ),
                    ],
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
                          const Text(
                            "Average User Rating",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          RatingBar.builder(
                            itemSize: 24,
                            ignoreGestures: true,
                            initialRating: filteredRoom[widget.index]
                                    .averageRating
                                    ?.toDouble() ??
                                0.0,
                            itemBuilder: (BuildContext context, int index) =>
                                const Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (double value) {  },
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
                            "#RM${filteredRoom[widget.index].id.toString().padLeft(4, "0")}"
                          ],
                          ["Name", filteredRoom[widget.index].type],
                          [
                            "Amount",
                            filteredRoom[widget.index].cost.toString()
                          ],
                          [
                            "Availability",
                            filteredRoom[widget.index].available == true
                                ? "Available"
                                : "Reserved"
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
                                            fontWeight: FontWeight.bold),
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
                      const SizedBox(
                        height: 6,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description:",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(filteredRoom[widget.index].description),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  child: Icon(
                                    Icons.wifi,
                                    color: filteredRoom[widget.index].hasWifi
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                                CircleAvatar(
                                  child: Icon(
                                    Icons.tv_outlined,
                                    color: filteredRoom[widget.index].hasTv
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                                CircleAvatar(
                                  child: Icon(
                                    Icons.window_outlined,
                                    color: filteredRoom[widget.index].hasView
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                                CircleAvatar(
                                  child: Icon(
                                    Icons.wb_iridescent,
                                    color: filteredRoom[widget.index].hasScent
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                                CircleAvatar(
                                    child: Icon(
                                  Icons.star,
                                  color: filteredRoom[widget.index].hasVip
                                      ? Colors.white
                                      : Colors.grey,
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //TODO
                      TextButton(onPressed: _show, child: Text("Pick Date")),
                      _selectedDateRange != null
                          ? Row(
                              children: [
                                Text(
                                  "Start Date:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    " ${_selectedDateRange?.start.toString().split(' ')[0]}"),
                                Expanded(child: Container()),
                                Text(
                                  "End Date:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    " ${_selectedDateRange?.end.toString().split(' ')[0]}"),
                              ],
                            )
                          : Container(),
                      const SizedBox(
                        height: 16,
                      ),
                      !filteredRoom[widget.index].available
                          ? Container(
                              clipBehavior: Clip.hardEdge,
                              width: width / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.green),
                              child: MaterialButton(
                                splashColor: Colors.transparent,
                                height: 40,
                                onPressed: () {
                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Room already booked")));
                                },
                                child: const Center(
                                  child: Text(
                                    "Booked",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))
                          : Container(
                              clipBehavior: Clip.hardEdge,
                              width: width / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.green),
                              child: MaterialButton(
                                splashColor: Colors.transparent,
                                height: 40,
                                onPressed: () {
                                  if(_selectedDateRange!=null){
                                    _bookRoom(
                                        userID,
                                        filteredRoom[widget.index].id,
                                        _selectedDateRange!.start,
                                        _selectedDateRange!.end);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please pick date")));

                                  }
                                },
                                child: const Center(
                                  child: Text(
                                    "Book",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                    ],
                  ),
                ),
          SizedBox(
            height: 16,
          ),
          selectedRoom == null
              ? Container()
              : const Divider(
                  height: 2,
                  thickness: 2,
                ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: const Text("Other Rooms",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 16 +
                (context.watch<Datamanagement>().allRooms.length % 2 == 0
                        ? context.watch<Datamanagement>().allRooms.length ~/ 2
                        : context.watch<Datamanagement>().allRooms.length ~/ 2 +
                            1) *
                    200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(builder: (context) {
                return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: filteredRoom.length,
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
                              selectedRoom = filteredRoom[i];
                              setState(() {
                                widget.index = i;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Image.network(
                                "${localhost}${context.read<Datamanagement>().allRooms[i].image[0]}",
                                fit: BoxFit.cover,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          Positioned(
                              bottom: 16,
                              right: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)),
                                    color: Colors.green),
                                height: 20,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2, bottom: 2, right: 8, left: 12),
                                  child: Center(
                                      child: Text(
                                    context
                                        .read<Datamanagement>()
                                        .allRooms[i]
                                        .type,
                                    style: const TextStyle(color: Colors.white),
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
}
