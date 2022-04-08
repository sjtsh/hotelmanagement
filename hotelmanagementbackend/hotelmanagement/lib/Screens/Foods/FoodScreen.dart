// import 'package:flutter/material.dart';
// import 'package:hotelmanagement/Screens/Foods/FoodDetails.dart';
// import 'package:hotelmanagement/Services/FoodService.dart';
//
// import '../../Models/Food.dart';
// import '../Header/Header.dart';
//
// class FoodScreen extends StatelessWidget {
//   const FoodScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 24,
//           ),
//
//           Header(context: context, width: width ,title: "Pick a food", lefticon: false,rightIcon: true, rightIc: Icons.shopping_cart),
//
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: FutureBuilder(
//                 future: FoodService().getFoods(),
//                 builder: (context,AsyncSnapshot snapshot) {
//                   if(snapshot.hasData) {
//                     List<Food> foods= snapshot.data;
//                       return GridView.builder(
//                           gridDelegate:
//                               const SliverGridDelegateWithMaxCrossAxisExtent(
//                                   maxCrossAxisExtent: 200,
//                                   childAspectRatio: 2 / 2,
//                                   crossAxisSpacing: 20,
//                                   mainAxisSpacing: 20),
//                           itemCount: foods.length,
//                           itemBuilder: (BuildContext ctx, index) {
//                             return Stack(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     //TODO : jkhaf ahdf
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (_) => FoodDetails(index, foods)));
//                                   },
//                                   child:  Container(
//                                     alignment: Alignment.center,
//                                     child: Image.network(
//                                       foods[index].img,
//                                       fit: BoxFit.cover,
//                                     ),
//                                     decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius:
//                                             BorderRadius.circular(15)),
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 16,
//                                     right: 0,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(8),
//                                               bottomLeft: Radius.circular(8)),
//                                           color: Colors.green),
//                                       height: 20,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 2,
//                                             bottom: 2,
//                                             right: 8,
//                                             left: 12),
//                                         child: Center(
//                                             child: Text(
//                                          foods[index].cost.toString(),
//                                           style: TextStyle(color: Colors.white),
//                                         )),
//                                       ),
//                                     ))
//                               ],
//                             );
//                           });
//                     }
//                   return Center(child: CircularProgressIndicator(),);
//                   }
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
