import 'package:flutter/material.dart';
import 'package:hotelmanagement/Services/BookingService.dart';
import 'package:provider/provider.dart';

import '../../StateManager/Datamanagement.dart';
import '../../global.dart';
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
          Header(
            context: context,
            width: width,
            title: "Bookings and Orders",
            lefticon: false,
            rightIcon: false,
          ),
          Expanded(
            child: FutureBuilder(
                future: BookingService().getBookings(userID),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    context.read<Datamanagement>().bookings = snapshot.data;
                    print(context.read<Datamanagement>().bookings.length);

                    return ListView.builder(
                        itemCount:
                        context.read<Datamanagement>().bookings.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
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
                              child: Row(
                                children: [
                                  Image.asset("assets/hotels.jpg",
                                      width: 120),
                                  const SizedBox(width: 12,),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                         "#RM${context.read<Datamanagement>().bookings[index].id}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(

                                           "${context.read<Datamanagement>().bookings[index].startDate.toString().substring(0,10)} to ${context.read<Datamanagement>().bookings[index].endDate.toString().substring(0,10)}")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator(),);
                }),
          )
        ],
      ),
    );
  }
}
