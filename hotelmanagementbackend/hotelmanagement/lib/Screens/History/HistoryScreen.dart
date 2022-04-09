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

      Padding(
        padding: const EdgeInsets.all(8.0),
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
          child:Center(
            child: ListTile(
              leading: Icon(Icons.card_travel, size: 48,),
              title:Text("${context.read<Datamanagement>().cart.length} items"),
              subtitle: Text("Foods"),

            ),
          )
        ),
      ),
          Expanded(
            child: FutureBuilder(
                future: BookingService().getBookings(userID),
                builder: (context, AsyncSnapshot snapshot) {
                  print(userID);
                  if (snapshot.hasData) {
                    context.read<Datamanagement>().bookings = snapshot.data;

                    return ListView.builder(
                        itemCount:
                           2,
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
                                  Image.network(
                                      "https://icons-for-free.com/iconfiles/png/512/youtube+icon-1320168265170749773.png",
                                      height: 120,
                                      width: 120),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                           // "#RM${context.read<Datamanagement>().bookings[index].id}",
                                            "helo",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "fjk")
                                             // "${context.read<Datamanagement>().bookings[index].startDate} to ${context.read<Datamanagement>().bookings[index].endDate}")
                                        ],
                                      ),
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
