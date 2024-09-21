import 'dart:convert';

DragonModel dragonModelFromJson(String str) => DragonModel.fromJson(json.decode(str));

String dragonModelToJson(DragonModel data) => json.encode(data.toJson());

class DragonModel {
    final String id;
    final String name;

    DragonModel({
        required this.id,
        required this.name,
    });

    factory DragonModel.fromJson(Map<String, dynamic> json) => DragonModel(
        id: json['id'],
        name: json['name'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
    };
}
