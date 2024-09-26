import 'dart:convert';

ShipModel shipModelFromJson(String str) => ShipModel.fromJson(json.decode(str));

class ShipModel {
  final Data data;

  ShipModel({
    required this.data,
  });

  factory ShipModel.fromJson(Map<String, dynamic> json) => ShipModel(
        data: Data.fromJson(json['data']),
      );
}

class Data {
  final List<Ship> ships;

  Data({
    required this.ships,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ships: List<Ship>.from(json['ships'].map((x) => Ship.fromJson(x))),
      );
}

class Ship {
  final String image;
  final String name;

  Ship({
    required this.image,
    required this.name,
  });

  factory Ship.fromJson(Map<String, dynamic> json) => Ship(
        image: (json['image'] != null) ? json['image'] : '',
        name: json['name'],
      );
}
