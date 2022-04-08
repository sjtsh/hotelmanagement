import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelmanagement/Screens/Foods/FoodDetails.dart';
import 'package:hotelmanagement/Screens/HomePage/HomeScreen.dart';
import 'package:hotelmanagement/Services/UserService.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:hotelmanagement/StateManager/LoginManagement.dart';
import 'package:hotelmanagement/StateManager/SignUpManagement.dart';
import 'package:provider/provider.dart';

import 'Screens/Floors/Floor1.dart';
import 'Screens/Floors/FloorScreen.dart';
import 'Screens/LoginScreen/LoginScreen.dart';

void main() {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> Datamanagement()),
    ChangeNotifierProvider(create: (_)=> LoginManagement()),
    ChangeNotifierProvider(create: (_)=> SignUpManagement()),

  ], child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),

        primarySwatch: Colors.blue,
      ),
      home: context.read<Datamanagement>().sherdFunction() == true ? HomeScreen(): LogInScreen(),
    );
  }
}


