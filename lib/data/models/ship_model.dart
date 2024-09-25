import 'dart:convert';

ShipModel shipModelFromJson(String str) => ShipModel.fromJson(json.decode(str));

String shipModelToJson(ShipModel data) => json.encode(data.toJson());

class ShipModel {
  final String id;
  final String name;
  final String image;

  ShipModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ShipModel.fromJson(Map<String, dynamic> json) => ShipModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
