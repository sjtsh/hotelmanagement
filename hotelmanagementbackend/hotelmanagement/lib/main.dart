import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelmanagement/Screens/Billing/BillingSceen.dart';
import 'package:hotelmanagement/Screens/Foods/FoodDetails.dart';
import 'package:hotelmanagement/Screens/HomePage/HomeScreen.dart';
import 'package:hotelmanagement/Services/UserService.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/LoginManagement.dart';
import 'package:hotelmanagement/StateManager/SignUpManagement.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Floors/Floor1.dart';
import 'Screens/Floors/FloorScreen.dart';
import 'Screens/LoginScreen/LoginScreen.dart';
import 'Services/BookingService.dart';
import 'Services/FoodService.dart';

void main() {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> Datamanagement()),
    ChangeNotifierProvider(create: (_)=> LoginManagement()),
    ChangeNotifierProvider(create: (_)=> SignUpManagement()),

  ], child: const MyApp(),),

  );
  BookingService().getBookings(1);

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {


    print(context.read<LoginManagement>().sharedValue);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),

        primarySwatch: Colors.blue,
      ),
      home:LogInScreen(),
    );
  }
}


