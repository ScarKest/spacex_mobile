import 'dart:convert';

RocketModel rocketModelFromJson(String str) =>
    RocketModel.fromJson(json.decode(str));

String rocketModelToJson(RocketModel data) => json.encode(data.toJson());

class RocketModel {
  final String id;
  final String name;

  RocketModel({
    required this.id,
    required this.name,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) => RocketModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
