import 'Food.dart';

class OrderBooking{
  final int? id;
  final int? rating;
  final DateTime created;
  final Map<int, int> items; //{<food_id>:<qty>}
  Map<Food, int> itemsIterable = {};
  OrderBooking(this.created, this.items,{this.id, this.rating, });
}