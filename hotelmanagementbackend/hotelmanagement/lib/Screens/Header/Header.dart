
import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  String ? title;
  double ? width;
  bool ? rightIcon;
  Function ? rightButton;
  IconData ? rightIc;
  BuildContext context;
  bool ? lefticon;
  Header(
      {this.title,
      this.width,
     required this.context,
      this.lefticon,
      this.rightIcon,
      this.rightButton,
      this.rightIc});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 3,
                color: Colors.black.withOpacity(0.1)),
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            lefticon ==true?  IconButton(onPressed: (){
             Navigator.pop(context);
            }, icon:Icon (Icons.arrow_back, color: Colors.black)): IconButton(onPressed: (){

            }, icon:Icon (rightIc, color: Colors.transparent,)),
            Text(
              title!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
           rightIcon==true? IconButton(onPressed: (){
             rightButton!();
           }, icon:Icon (rightIc)):IconButton(onPressed: (){

           }, icon:Icon (rightIc, color: Colors.transparent,)),
          ],
        ),
      ),
    );
  }
}
