import 'package:flutter/material.dart';
import 'package:hotelmanagement/Screens/RoomDetails/RoomDetails.dart';
import 'package:provider/provider.dart';

import '../../Models/Room.dart';
import '../../StateManager/Datamanagement.dart';

class Floor1 extends StatefulWidget {
  final Function refresh;
  Floor1(this.refresh);

  @override
  State<Floor1> createState() => _Floor1State();
}

class _Floor1State extends State<Floor1> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Room> rooms = context.read<Datamanagement>().allRooms;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(16)),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RoomDetails(0)));
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: rooms[0].available ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text(
                      "101",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => RoomDetails(7)));
                      widget.refresh();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: rooms[7].available ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: Text(
                        "108",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => RoomDetails(6)));
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: rooms[6].available ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: Text(
                        "107",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => RoomDetails(1)));
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                rooms[1].available ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                            child: Text(
                          "102",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => RoomDetails(2)));
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                rooms[2].available ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                            child: Text(
                          "103",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RoomDetails(5)));
                    setState(() {});
                  },
                  child: Container(
                    height: 112,
                    decoration: BoxDecoration(
                        color: rooms[5].available ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text(
                      "106",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => RoomDetails(3)));
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: rooms[3].available ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: Text(
                        "104",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RoomDetails(4)));
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: rooms[4].available ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text(
                      "105",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
