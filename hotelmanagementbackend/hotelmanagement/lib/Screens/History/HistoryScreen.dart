import 'package:flutter/material.dart';

import '../Header/Header.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
         // Header("Past Bookings and Orders", width,  (){},false, (){}, Icons.home_filled),

          Header(context: context, width: width ,title: "Past Bookings and Orders", lefticon: false,rightIcon: false,),
        ],
      ),
    );
  }
}
