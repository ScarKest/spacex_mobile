import 'dart:convert';

DragonModel dragonModelFromJson(String str) =>
    DragonModel.fromJson(json.decode(str));

class DragonModel {
  final Data data;

  DragonModel({
    required this.data,
  });

  factory DragonModel.fromJson(Map<String, dynamic> json) => DragonModel(
        data: Data.fromJson(json['data']),
      );
}

class Data {
  final List<Dragon> dragons;

  Data({
    required this.dragons,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dragons:
            List<Dragon>.from(json['dragons'].map((x) => Dragon.fromJson(x))),
      );
}

class Dragon {
  final String id;
  final String name;

  Dragon({
    required this.id,
    required this.name,
  });

  factory Dragon.fromJson(Map<String, dynamic> json) => Dragon(
        id: json['id'],
        name: json['name'],
      );
}
