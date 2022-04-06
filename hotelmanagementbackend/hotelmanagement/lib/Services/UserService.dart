import 'dart:async';
import 'dart:convert';

import 'package:hotelmanagement/Models/Food.dart';
import 'package:hotelmanagement/Models/OrderBooking.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../global.dart';

class UserService {
  Future<bool> signUp(String username, String password) async {
    Response res = await http.post(Uri.parse("$localhost/signup"), body: {
      "username": username,
      "password": password,
    });
    if(res.statusCode == 200){
      if(jsonDecode(res.body) != false){
        Map<String, dynamic> response =  jsonDecode(res.body);
        username = response["username"];
        userCreated = response["created"];
        return true;
      }
      //username already in use
      return false;
    }
    //unsuccesful
    return false;
  }

  Future<bool> signIn(String username, String password) async {
    Response res = await http.post(Uri.parse("$localhost/signin"), body: {
      "username": username,
      "password": password,
    });
    if(res.statusCode == 200){
      if(jsonDecode(res.body) != false){
        Map<String, dynamic> response =  jsonDecode(res.body);
        username = response["username"];
        userCreated = response["created"];
        return true;
      }
      //incorrect credentials
      return false;
    }
    //unsuccesful
    return false;
  }
}
