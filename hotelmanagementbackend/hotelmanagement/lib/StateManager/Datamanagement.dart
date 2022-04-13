import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:hotelmanagement/Models/RoomBooking.dart';
import 'package:hotelmanagement/Services/FoodService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Cart.dart';
import '../Models/Food.dart';
import '../Models/Room.dart';

class Datamanagement with ChangeNotifier, DiagnosticableTreeMixin {
  List<Food> allFoods = [];
  List<Map> cart = [] ;

  List<Room> _allRooms = [];
  List<Room> allRoomsDisplay = [];
  List<RoomBooking> bookings = [];
  List<OrderBooking> orderbookings = [];
  // List<Cart> cartItems = [];
  Map<int, int> cartItems = {}; //id of food, qty

  int ? sharedValue ;

  List<Room> get allRooms => _allRooms;

  set allRooms(List<Room> value) {
    _allRooms = value;
  }



}

