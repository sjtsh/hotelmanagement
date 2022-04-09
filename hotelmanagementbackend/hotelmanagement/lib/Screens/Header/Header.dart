
import 'package:flutter/material.dart';
import 'package:hotelmanagement/StateManager/Datamanagement.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {

  String ? title;
  double ? width;
  bool ? rightIcon;
  Function ? rightButton;
  Function ? leftButton;
  IconData ? rightIc;
  IconData ? leftIc;
  BuildContext context;
  bool ? lefticon;
  Header(
      {this.title,
      this.width,
     required this.context,
      this.lefticon,
      this.rightIcon,
      this.rightButton,
        this.leftIc,
        this.leftButton,
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
             leftButton!();
           }, icon:Icon (leftIc,  color: context.watch<Datamanagement>().cartItems.length==0? Colors.black : Colors.green,)):IconButton(onPressed: (){

           }, icon:Icon (leftIc, color: Colors.transparent,)),
          ],
        ),
      ),
    );
  }
}
