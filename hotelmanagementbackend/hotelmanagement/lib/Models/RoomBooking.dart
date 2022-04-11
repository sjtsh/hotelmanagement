class RoomBooking {
  int? id;
  int roomID;
  int? rating;
  DateTime startDate;
  DateTime endDate;

  RoomBooking(
    this.roomID,
    this.startDate,
    this.endDate, {
    this.id,
    this.rating,
  });
}
