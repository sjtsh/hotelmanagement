class OrderBooking{
  final int? id;
  final int? rating;
  final DateTime created;
  final Map<String, dynamic> items; //{<food_id>:<qty>}
  OrderBooking(this.created, this.items,{this.id, this.rating, });
}