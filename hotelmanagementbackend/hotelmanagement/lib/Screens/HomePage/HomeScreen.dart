
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/Screens/Foods/FoodDetails.dart';
import 'package:hotelmanagement/Screens/Foods/FoodScreen.dart';
import 'package:hotelmanagement/Screens/UserInfo/UserScreen.dart';

import '../Floors/FloorScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 1;

  final screen = [
   // HistoryScreen(),
    Floor(),
    FoodDetails(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.orange,

          currentIndex: _currentindex,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
                label: "Rooms",
                icon: Icon(Icons.meeting_room_outlined),
                ),
            BottomNavigationBarItem(
                label: "Foods",
                icon: Icon(Icons.fastfood_outlined),
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                label: "Info",
               ),
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
