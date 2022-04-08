import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/StateManager/SignUpManagement.dart';
import 'package:provider/provider.dart';

import '../../StateManager/LoginManagement.dart';
import '../LoginScreen/LoginScreen.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(16),
                topLeft: const Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 32,
                    top: 32,
                  ),
                  child: Text(
                    "Register",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextFormField(
                    controller:
                        context.read<SignUpManagement>().usernameController,
                    onTap: () {},
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      errorText: context.watch<SignUpManagement>().userErrorText,
                      suffixIcon: const Icon(Icons.person),
                      hintText: "Username",
                      fillColor: const Color(0xffF3F3F3),
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
                        context.read<SignUpManagement>().passwordTextController,
                    obscureText:
                        context.watch<SignUpManagement>().isPasswordShown
                            ? false
                            : true,
                    onTap: () {},
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      errorText:
                          context.watch<SignUpManagement>().passwordErrorText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<SignUpManagement>().showPassword();
                        },
                        icon: Icon(
                            context.watch<SignUpManagement>().isPasswordShown
                                ? Icons.visibility
                                : Icons.visibility_off),
                      ),
                      hintText: "Password",
                      fillColor: const Color(0xffF3F3F3),
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
                            color: const Color(0xff72D7CB)),
                        child: context.watch<SignUpManagement>().isLoading
                            ? MaterialButton(
                                splashColor: Colors.transparent,
                                height: 40,
                                onPressed: () async {},
                                child: const Center(
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
                                      .read<SignUpManagement>()
                                      .validateMobileNumber();
                                  if (isValidated) {
                                    await context
                                        .read<SignUpManagement>()
                                        .signUp(context);
                                  }
                                },
                                child: const Center(
                                  child: const Text(
                                    "Register",
                                    style: const TextStyle(
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
                      const Text(
                        "Already have an account?",
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      TextButton(
                        onPressed: () async {
                         //  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                         // const LogInScreen()));
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Log in",
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
