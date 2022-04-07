import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/Floors/Floor1.dart';
import 'Screens/Floors/FloorScreen.dart';

void main() {
  runApp(const MyApp());
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
      home: const Floor(),
    );
  }
}


