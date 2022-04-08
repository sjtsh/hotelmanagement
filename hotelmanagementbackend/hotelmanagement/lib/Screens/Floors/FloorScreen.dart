import 'package:flutter/material.dart';
import 'package:hotelmanagement/Screens/Header/Header.dart';

import 'Floor1.dart';
import 'Floor2.dart';


class Floor extends StatelessWidget {
  const Floor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          // Header("Pick a room", context, width,false,  false, (){}, Icons.home_filled),
          Header(context: context, width: width ,title: "Pick a room", lefticon: false,rightIcon: false,),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Floor 1"),
                ),
                Divider(
                  height: 2,
                  thickness: 3,
                ),
                Floor1(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Floor 2"),
                ),
                Divider(
                  height: 2,
                  thickness: 3,
                ),
                Floor2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
