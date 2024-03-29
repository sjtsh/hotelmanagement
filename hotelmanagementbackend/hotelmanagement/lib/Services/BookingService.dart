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
          .map((e) {
            List<dynamic> images = e["image"];
        return
          Room(
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
              List.generate(images.length, (index) => images[index]),
              averageRating: e["rating"]);
      })
          .toList();
      return rooms;
    }
    return [];
  }

  Future<bool> rateBooking(int roomBookingId, int rating) async {
    Response res = await http.put(Uri.parse("$localhost/booking/rate/"), body: {
      "id": roomBookingId.toString(),
      "rating": rating.toString(),
    });
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<RoomBooking?> createBooking(int userId, int roomId, DateTime start,
      DateTime end) async {
    Response res =
    await http.post(Uri.parse("$localhost/booking/create/"), body: {
      "user_id": userId.toString(),
      "room_id": roomId.toString(),
      "start_date": start.toString(),
      "end_date": end.toString(),
    });
    if (res.statusCode == 200) {
      try {
        Map<String, dynamic> response = jsonDecode(res.body);
        return RoomBooking(
            response["room_id"], response["start_date"], response["end_date"],
            id: response["id"]);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<List<RoomBooking>> getBookings(int userId) async {
    Response res = await http.get(Uri.parse("$localhost/bookings/$userId"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<RoomBooking> roomBookings = response.map((e) {
        return RoomBooking(
            e["room_id"],
            DateTime.parse(e["start_date"] + " 00:00:00"),
            DateTime.parse(e["end_date"] + " 00:00:00"),
            id: e["id"],
            rating: e["rating"]);
      }).toList();
      return roomBookings;
    }
    return [];
  }
}
