class Room {
  int id;
  int cost;
  String type; //deluxe, modern
  String snippet; //2bhk
  String description;
  bool hasTv;
  bool hasScent;
  bool hasVip;
  bool hasView;
  bool hasWifi;
  bool available;
  int? averageRating;
  List<String> image;

  Room(
    this.id,
    this.cost,
    this.type,
    this.snippet,
    this.description,
    this.hasTv,
    this.hasScent,
    this.hasVip,
    this.hasView,
    this.hasWifi,
    this.available,
    this.image, {
    this.averageRating,
  });
}
