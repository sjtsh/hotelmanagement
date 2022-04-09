import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hotelmanagement/Models/RoomBooking.dart';
import 'package:hotelmanagement/Services/FoodService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Food.dart';
import '../Models/Room.dart';

class Datamanagement with ChangeNotifier, DiagnosticableTreeMixin {
  List<Food> allFoods = [];
  List<Map> cart = [] ;

  List<Room> allRooms = [];
  List<RoomBooking> bookings = [];

  int ? sharedValue ;
  //
  // sherdFunction() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int? myvalue = prefs.getInt("id"); // myvalue : value
  //
  //   // if (myvalue != null) {
  //   //   return true;
  //   // } else {
  //   //   return false;
  //   // }
  //   sharedValue = myvalue;
  // }
  getShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? myvalue = prefs.getInt("id");
    print(" shared on $myvalue");
    sharedValue=myvalue;
    notifyListeners();
  }

}

