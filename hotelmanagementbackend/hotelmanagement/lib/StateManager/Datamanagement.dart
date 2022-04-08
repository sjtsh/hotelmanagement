import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hotelmanagement/Services/FoodService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Food.dart';

class Datamanagement with ChangeNotifier, DiagnosticableTreeMixin {
  List<Food> allFoods = [];

  sherdFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? myvalue = prefs.getInt("id"); // myvalue : value

    if (myvalue != null) {
      return true;
    } else {
      return false;
    }
  }

  a() {
    sherdFunction().then(() {
      print("hi");
    });
}
}
