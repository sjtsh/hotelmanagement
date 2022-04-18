import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelmanagement/Screens/Foods/FoodDetails.dart';
import 'package:hotelmanagement/Screens/HomePage/HomeScreen.dart';
import 'package:hotelmanagement/Services/UserService.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/LoginManagement.dart';
import 'package:hotelmanagement/StateManager/SignUpManagement.dart';
import 'package:hotelmanagement/global.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Floors/Floor1.dart';
import 'Screens/Floors/FloorScreen.dart';
import 'Screens/LoginScreen/LoginScreen.dart';
import 'Services/BookingService.dart';
import 'Services/FoodService.dart';

void main() {
  FoodService().getOrders(1);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Datamanagement()),
        ChangeNotifierProvider(create: (_) => LoginManagement()),
        ChangeNotifierProvider(create: (_) => SignUpManagement()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              userName =snapshot.data.getString("username").toString().toUpperCase();
              UserService()
                  .signIn(
                snapshot.data.getString("username").toString(),
                snapshot.data.getString("password").toString(),
              )
                  .then((value) {
                if (value) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen())) ;
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification failed, Please login to proceed")));
                }
              });
            }
            return LogInScreen();
          }),
    );
  }
}
