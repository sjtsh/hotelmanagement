import 'package:hotelmanagement/Models/Food.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../global.dart';

class FoodService{

  Future<List<Food>> getFoods() async {
    Response res = await http.get(Uri.parse("$localhost/foods"));
    return [];
  }

}