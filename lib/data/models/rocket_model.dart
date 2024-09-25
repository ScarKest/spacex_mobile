import 'dart:convert';

RocketModel rocketModelFromJson(String str) =>
    RocketModel.fromJson(json.decode(str));

class RocketModel {
  final Data data;

  RocketModel({
    required this.data,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) => RocketModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Rocket> rockets;

  Data({
    required this.rockets,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rockets:
            List<Rocket>.from(json["rockets"].map((x) => Rocket.fromJson(x))),
      );
}

class Rocket {
  final String id;
  final String name;

  Rocket({
    required this.id,
    required this.name,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        id: json["id"],
        name: json["name"],
      );
}
