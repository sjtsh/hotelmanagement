import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/Screens/HomePage/HomeScreen.dart';
import 'package:hotelmanagement/Screens/SignUpScreen/SignUpScreen.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../StateManager/Datamanagement.dart';
import '../../StateManager/LoginManagement.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}



class _LogInScreenState extends State<LogInScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Datamanagement>().getShared();
}


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return context.read()<Datamanagement>().sharedValue !=null? HomeScreen() : Scaffold(
      body: ListView(
        children: [
          Container(
            height: height / 3,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/hotels.jpg",
                width: width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: height*2 / 3-45,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    top: 32,
                  ),
                  child: Text(
                    "Login",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextFormField(
                    controller:
                        context.read<LoginManagement>().usernameController,
                    onTap: () {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      errorText: context.watch<LoginManagement>().userErrorText,
                      suffixIcon: Icon(Icons.person),
                      hintText: "Username",
                      fillColor: Color(0xffF3F3F3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextFormField(
                    controller:
                        context.read<LoginManagement>().passwordTextController,
                    obscureText:
                        context.watch<LoginManagement>().isPasswordShown
                            ? false
                            : true,
                    onTap: () {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      errorText:
                          context.watch<LoginManagement>().passwordErrorText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<LoginManagement>().showPassword();
                        },
                        icon: Icon(
                            context.watch<LoginManagement>().isPasswordShown
                                ? Icons.visibility
                                : Icons.visibility_off),
                      ),
                      hintText: "Password",
                      fillColor: Color(0xffF3F3F3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Center(
                      child: InkWell(
                    splashColor: Colors.grey,
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xff72D7CB)),
                        child: context.watch<LoginManagement>().isLoading
                            ? MaterialButton(
                                splashColor: Colors.transparent,
                                height: 40,
                                onPressed: () async {},
                                child: Center(
                                  child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        backgroundColor: Colors.white,
                                        color: Color(0xff72D7CB),
                                      )),
                                ),
                              )
                            : MaterialButton(
                                splashColor: Colors.transparent,
                                height: 40,
                                onPressed: () async {
                                  bool isValidated = context
                                      .read<LoginManagement>()
                                      .validateMobileNumber();
                                  if (isValidated) {
                                    await context
                                        .read<LoginManagement>()
                                        .login(context);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      TextButton(
                        onPressed: () async {
                          //TODO: navigate to signup page
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                       SignUpScreen()));
                        },
                        child: Text(
                          "Register Instead.",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
