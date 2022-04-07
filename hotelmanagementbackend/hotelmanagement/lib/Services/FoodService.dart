import 'dart:async';
import 'dart:convert';

import 'package:hotelmanagement/Models/Food.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../global.dart';

class FoodService {
  Future<List<Food>> getFoods() async {
    Response res = await http.get(Uri.parse("$localhost/foods"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<Food> foods = response
          .map((e) => Food(
              e["id"], e["name"], e["img"], e["cost"], e["in_stock"],
              rating: e["rating"]))
          .toList();
      return foods;
    }
    return [];
  }

  Future<bool> rateOrder(int orderId, int rating) async {
    Response res = await http.put(Uri.parse("$localhost/order/rate"), body: {
      "id": orderId,
      "rating": rating,
    });
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    return false;
  }

  Future<OrderBooking?> createOrder(int userId, Map<int, int> items) async {
    Response res = await http.put(Uri.parse("$localhost/order/rate"), body: {
      "user_id": userId,
      "items": items,
    });
    if (res.statusCode == 200) {
      Map<String, dynamic> response = jsonDecode(res.body);
      try {
        return OrderBooking(response["created"], response["items"],
            id: response["id"]);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<List<OrderBooking>> getOrders(int userId) async {
    Response res = await http.get(Uri.parse("$localhost/orders/$userId"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<OrderBooking> orderBookings = response
          .map((e) => OrderBooking(e["created"], e["items"],
              id: e["id"], rating: e["rating"]))
          .toList();
      return orderBookings;
    }
    return [];
  }
}
