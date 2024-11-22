// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApartmentTypeModel {
  final String name, imageIcon;
  ApartmentTypeModel({
    required this.name,
    required this.imageIcon,
  });

  factory ApartmentTypeModel.empty() =>
      ApartmentTypeModel(name: "", imageIcon: "");

  Map<String, dynamic> toJson() {
    return {'name': name, 'imageIcon': imageIcon};
  }

  factory ApartmentTypeModel.fromJson(Map<String, dynamic> json) {
    return ApartmentTypeModel(
      name: json['name'] as String,
      imageIcon: json['imageIcon'] as String,
    );
  }

  
}
