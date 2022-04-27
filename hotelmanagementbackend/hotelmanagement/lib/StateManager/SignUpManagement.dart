


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/Screens/LoginScreen/LoginScreen.dart';
import 'package:hotelmanagement/Services/UserService.dart';
import 'package:provider/provider.dart';

import '../Screens/HomePage/HomeScreen.dart';

class SignUpManagement with  ChangeNotifier, DiagnosticableTreeMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  int loadingAt = 0;
  String loadingText = "";
  String? userErrorText = "";
  String? passwordErrorText;
  bool isLoading = false;
  bool isPasswordShown = false;
  bool isVerified = false;



signUp(context) async {
  try {
    isLoading = true;
    notifyListeners();
    await UserService()
        .signUp(usernameController.text, passwordTextController.text).then((value){
          if(value){
            print(value);
            isLoading = false;
           return Navigator.push(context, MaterialPageRoute(builder: (_){
              return const LogInScreen();



          }));

    } else{
            return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Registration  Failed, user already exists "),));
          }
        } );


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
    }else {
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

}

