
import 'package:flutter/material.dart';

class Floor1 extends StatelessWidget {
  const Floor1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16)),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(child: Text("101", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(child: Text("108", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(child: Text("107", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(child: Text("102", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(child: Text("103", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 112,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(child: Text("106", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(child: Text("104", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(child: Text("105", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
