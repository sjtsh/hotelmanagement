
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/Screens/Foods/FoodDetails.dart';
import 'package:hotelmanagement/Screens/Foods/FoodScreen.dart';
import 'package:hotelmanagement/Screens/History/HistoryScreen.dart';

import '../Floors/FloorScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 1;

  final screen = [
    HistoryScreen(),
    Floor(),
    FoodDetails(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online),
            label: "History",
            backgroundColor: Colors.green),
            BottomNavigationBarItem(
                label: "Rooms",
                icon: Icon(Icons.meeting_room_outlined),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                label: "foods",
                icon: Icon(Icons.fastfood_outlined),
                )
          ],
          onTap: (index){
            setState(() {
              _currentindex =index;
            });

          },

        ),
        body:screen[_currentindex]
      ),
    );
  }
}
