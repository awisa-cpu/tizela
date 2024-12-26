class ShortletTypeModel {
  final String name, imageUrl;

  ShortletTypeModel({required this.name, required this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
    };
  }

  factory ShortletTypeModel.empty() =>
      ShortletTypeModel(name: "", imageUrl: "");

  factory ShortletTypeModel.fromJson(Map<String, dynamic> json) {
    return ShortletTypeModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
