
class CarBrandModel {
  final String id, name, imageUrl;
  CarBrandModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id':id,
      'name':name,
      'imageUrl': imageUrl,
    };
  }

  factory CarBrandModel.fromJson(Map<String, dynamic> json) {
    return CarBrandModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl']
    );
  }

  factory CarBrandModel.empty()=>CarBrandModel(id:"", name: "", imageUrl:"");


}
