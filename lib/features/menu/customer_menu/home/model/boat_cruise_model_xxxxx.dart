// ignore_for_file: public_member_api_docs, sort_constructors_first
class BoatCruiseModelxxxxxxxx {
  final String id;
  final String imageUrl;
  final String name;
  final int imagesCount;
  final int leastPassengerCount, maxPassengerCount;
  final String cost;
  BoatCruiseModelxxxxxxxx({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.maxPassengerCount,
    required this.leastPassengerCount,
    required this.cost,
    required this.imagesCount,
  });

  String get passengerRange =>
      "$leastPassengerCount - $maxPassengerCount passenger";
}
