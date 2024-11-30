import 'package:equatable/equatable.dart';

class ApartmentTypeModel extends Equatable {
  final String name, imageIcon;
  const ApartmentTypeModel({
    required this.name,
    required this.imageIcon,
  });

  factory ApartmentTypeModel.empty() =>
      const ApartmentTypeModel(name: "", imageIcon: "");

  Map<String, dynamic> toJson() {
    return {'name': name, 'imageIcon': imageIcon};
  }

  factory ApartmentTypeModel.fromJson(Map<String, dynamic> json) {
    return ApartmentTypeModel(
      name: json['name'] as String,
      imageIcon: json['imageIcon'] as String,
    );
  }

  @override
  List<Object?> get props => [name, imageIcon];
}
