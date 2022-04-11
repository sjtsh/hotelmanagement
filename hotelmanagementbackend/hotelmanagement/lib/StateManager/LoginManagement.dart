import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/Services/UserService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/HomePage/HomeScreen.dart';
import '../global.dart';

class LoginManagement with ChangeNotifier, DiagnosticableTreeMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  int loadingAt = 0;
  String loadingText = "";
  String? userErrorText = "";
  String? passwordErrorText;
  bool isLoading = false;
  bool isPasswordShown = false;
  bool isVerified = false;
  int? sharedValue;

  login(context) async {
    try {
      isLoading = true;
      notifyListeners();
      await UserService()
          .signIn(usernameController.text, passwordTextController.text)
          .then((value) async {
        if (value) {
          isLoading = false;
          print("hi ${userID}");

          setShared(usernameController.text, userID, passwordTextController.text);
          return Navigator.push(context, MaterialPageRoute(builder: (_) {
            return HomeScreen();
          }));
        } else {
          return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Login Failed"),
          ));
        }
      });

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  bool validateMobileNumber() {
    bool myPersonalValidation = true;
    if (usernameController.text == "" || usernameController.text.isEmpty) {
      userErrorText = "Please enter username";
      myPersonalValidation = false;
    } else {
      userErrorText = null;
      notifyListeners();
    }
    if (passwordTextController.text == "" ||
        passwordTextController.text.isEmpty) {
      passwordErrorText = "Please enter password";
      myPersonalValidation = false;
      notifyListeners();
    } else {
      passwordErrorText = null;
      notifyListeners();
    }
    return myPersonalValidation;
  }

  showPassword() {
    isPasswordShown = !isPasswordShown;
    notifyListeners();
  }

  Future<void> setShared(String username, int userId, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("id", userId);
    prefs.setString("username", username);
    prefs.setString("password", password);
  }

}
