import 'package:flutter/material.dart';
import 'package:hotelmanagement/Models/Cart.dart';
import 'package:hotelmanagement/Models/RoomBooking.dart';
import 'package:hotelmanagement/Screens/CartScreen/CartScreen.dart';
import 'package:hotelmanagement/Screens/LoginScreen/LoginScreen.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/global.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/BookingService.dart';
import '../Header/Header.dart';
import '../History/HistoryScreen.dart';

class UserScreen extends StatelessWidget {
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
          Header(
            context: context,
            width: width,
            title: "Bookings and Orders",
            lefticon: true,
            rightIcon: false,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(child: Text(userName[0])),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      userName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => CartScreen()));
                  },
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.3))
                        ]),
                    width: width,
                    child: Center(
                      child: ListTile(
                        leading: Icon(
                          Icons.fastfood,
                          size: 32,
                        ),
                        title: Text("My tiffin box"),
                        subtitle: Text(context
                                .watch<Datamanagement>()
                                .cartItems
                                .length
                                .toString() +
                            " Items"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => HistoryScreen()));
                  },
                  child: FutureBuilder(
                      future: BookingService().getBookings(userID),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          context.read<Datamanagement>().bookings =
                              snapshot.data;

                          return Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                      color: Colors.black.withOpacity(0.3))
                                ]),
                            width: width,
                            child: Center(
                              child: ListTile(
                                leading: Icon(
                                  Icons.door_back_door_outlined,
                                  size: 32,
                                ),
                                title: Text("My bookings"),
                                subtitle: Text(context
                                        .watch<Datamanagement>()
                                        .bookings
                                        .length
                                        .toString() +
                                    " Rooms"),
                              ),
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LogInScreen()));
                },
                backgroundColor: Colors.orange,
                child: Icon(Icons.login_outlined),
              ),
            ),
          )
        ],
      ),
    );
  }
}
