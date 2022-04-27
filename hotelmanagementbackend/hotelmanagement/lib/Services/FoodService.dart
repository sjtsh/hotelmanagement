import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dv;
import 'dart:math';

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
          .map((e) =>
          Food(
              e["id"], e["name"], e["img"], e["cost"], e["in_stock"],
              rating: e["rating"]))
          .toList();
      return foods;
    }
    return [];
  }

  Future<bool> rateOrder(int orderId, int rating) async {
    Response res = await http.put(Uri.parse("$localhost/order/rate/"), body: {
      "id": orderId.toString(),
      "rating": rating.toString(),
    });
    print(res.body);
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    return false;
  }

  Future<List<OrderBooking>?> createOrder(int userId,
      Map<int, int> items) async {
    Response res = await http.post(
        Uri.parse("$localhost/order/create/"), body: {
      "user_id": userId.toString(),
      "items": items.toString(),
    });
    print(res.body);
    if (res.statusCode == 200) {
      try {
        Map<String, dynamic> response = jsonDecode(res.body);
        // Map<int, dynamic>  items=  response["items"];

        List<OrderBooking> orderBookings = [];


        Map<int, int> items = {};

        Map<String, dynamic> tobeparsed = response["items"];
        tobeparsed.forEach((key, value) {
          items[int.parse(key)] = int.parse(value.toString());
        });

        orderBookings.add(
            OrderBooking(DateTime.parse(response["created"]), items,
                id: response["id"]));

        print("orderBookings");
        print(orderBookings);

        return orderBookings;
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<List<OrderBooking>> getOrders(int userId) async {
    Response res = await http.get(Uri.parse("$localhost/orders/$userId"));
    dv.log(res.body.toString());
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<OrderBooking> orderBookings = response
          .map((e) {
        Map<int, int> items = {};

        Map<String, dynamic> tobeparsed = e["items"];
        tobeparsed.forEach((key, value) {
          items[int.parse(key)] = int.parse(value.toString());
        });
        return OrderBooking(DateTime.parse(e["created"]), items,
            id: e["id"], rating: e["rating"]);
      })
          .toList();

      return orderBookings;
    }
    return [];
  }

}
