class CarTypeDetailsModel {
  final String name, subText;
  final String? body;
   bool isExpanded;
  CarTypeDetailsModel(
    this.name, {
    required this.subText,
    this.body,
    this.isExpanded = false,
  });
}
