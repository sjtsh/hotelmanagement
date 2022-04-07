
import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  String ? title;
  double ? width;
  bool rightIcon;
  Function rightButton;
  IconData rightIc;
  Header(this.title, this.width, this.rightIcon, this.rightButton, this.rightIc);


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
            rightIcon?  IconButton(onPressed: (){}, icon:Icon (Icons.arrow_back)): Container(),
            Text(
              title!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
           rightIcon? IconButton(onPressed: (){
             rightButton();
           }, icon:Icon (rightIc)):Container(),
          ],
        ),
      ),
    );
  }
}
