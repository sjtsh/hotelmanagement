class RoomBooking {
  int? id;
  int roomID;
  int? rating;
  String startDate;
  String endDate;

  RoomBooking(
    this.roomID,
    this.startDate,
    this.endDate, {
    this.id,
    this.rating,
  });
}
