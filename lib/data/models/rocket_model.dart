
import 'dart:convert';

RocketModel rocketModelFromJson(String str) => RocketModel.fromJson(json.decode(str));

String rocketModelToJson(RocketModel data) => json.encode(data.toJson());

class RocketModel {
    final Data data;

    RocketModel({
        required this.data,
    });

    factory RocketModel.fromJson(Map<String, dynamic> json) => RocketModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    final List<Rocket> rockets;

    Data({
        required this.rockets,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        rockets: List<Rocket>.from(json["rockets"].map((x) => Rocket.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rockets": List<dynamic>.from(rockets.map((x) => x.toJson())),
    };
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}






































// import 'dart:convert';

// List<RocketModel> rocketModelFromJson(String str) => List<RocketModel>.fromJson(json.decode(str));

// class RocketModel {
//     final Data data;

//     RocketModel({
//         required this.data,
//     });

//     factory List<RocketModel>.fromJson(Map<String, dynamic> json) => RocketModel(
//         data: Data.fromJson(json["data"]),
//     );

// }

// class Data {
//     final List<Rocket> rockets;

//     Data({
//         required this.rockets,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         rockets: List<Rocket>.from(json["rockets"].map((x) => Rocket.fromJson(x))),
//     );

// }

// class Rocket {
//     final String id;
//     final String name;

//     Rocket({
//         required this.id,
//         required this.name,
//     });

//     factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
//         id: json["id"],
//         name: json["name"],
//     );
// }
























// // List<RocketModel> rocketModelFromJson(String str) =>
// //     RocketModel.fromJson(json.decode(str));

// // String rocketModelToJson(RocketModel data) => json.encode(data.toJson());

// // class RocketModel {
// //   final String id;
// //   final String name;

// //   RocketModel({
// //     required this.id,
// //     required this.name,
// //   });

// //   factory RocketModel.fromJson(Map<String, dynamic> json) => RocketModel(
// //         id: json['id'],
// //         name: json['name'],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         'id': id,
// //         'name': name,
// //       };
// // }
