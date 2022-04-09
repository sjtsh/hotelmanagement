import 'dart:async';
import 'dart:convert';

import 'package:hotelmanagement/Models/Food.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:hotelmanagement/Models/Room.dart';
import 'package:hotelmanagement/Models/RoomBooking.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../global.dart';

class BookingService {
  Future<List<Room>> getRooms() async {
    Response res = await http.get(Uri.parse("$localhost/rooms"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<Room> rooms = response
          .map((e) => Room(
              e["id"],
              e["cost"],
              e["type"],
              e["snippet"],
              e["description"],
              e["has_tv"],
              e["has_scent"],
              e["has_vip"],
              e["has_view"],
              e["has_wifi"],
              e["available"],
              e["image"],
              averageRating: e["rating"]))
          .toList();
      return rooms;
    }
    return [];
  }

  Future<bool> rateBooking(int roomBookingId, int rating) async {
    Response res = await http.put(Uri.parse("$localhost/booking/rate"), body: {
      "id": roomBookingId,
      "rating": rating,
    });
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    return false;
  }

  Future<RoomBooking?> createBooking(
      int userId, int roomId, DateTime start, DateTime end) async {
    Response res =
        await http.put(Uri.parse("$localhost/booking/create"), body: {
      "user_id": userId,
      "room_id": roomId,
      "start_date": start,
      "end_date": end,
    });
    if (res.statusCode == 200) {
      Map<String, dynamic> response = jsonDecode(res.body);
      try {
        return RoomBooking(
            response["room_id"], response["startDate"], response["endDate"],
            id: response["id"]);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<List<RoomBooking>> getBookings(int userId) async {
    Response res = await http.get(Uri.parse("$localhost/bookings/$userId"));
    print(res.body);
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<RoomBooking> roomBookings = response
          .map((e) => RoomBooking(e["room_id"], e["startDate"], e["endDate"],
              id: e["id"], rating: e["rating"]))
          .toList();
      return roomBookings;
    }
    return [];
  }
}
