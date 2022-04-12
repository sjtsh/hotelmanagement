
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/Room.dart';
import '../../StateManager/Datamanagement.dart';
import '../RoomDetails/RoomDetails.dart';

class Floor2 extends StatelessWidget {
  const Floor2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Room> rooms = context.read<Datamanagement>().allRooms;
    print(rooms);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16)),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RoomDetails(8)));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: rooms[8].available ? Colors.green: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(child: Text("201", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RoomDetails(14)));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: rooms[14].available ? Colors.green: Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(child: Text("207", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
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
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RoomDetails(9)));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: rooms[9].available ? Colors.green: Colors.red,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(child: Text("202", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RoomDetails(10)));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: rooms[10].available ? Colors.green: Colors.red,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(child: Text("203", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RoomDetails(13)));
                  },
                  child: Container(
                    height: 112,
                    decoration: BoxDecoration(
                        color: rooms[13].available ? Colors.green: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(child: Text("206", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
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
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RoomDetails(11)));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: rooms[11].available ? Colors.green: Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(child: Text("204", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RoomDetails(12)));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: rooms[12].available ? Colors.green: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(child: Text("205", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
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
