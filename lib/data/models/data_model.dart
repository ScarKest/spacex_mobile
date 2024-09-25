import 'dart:convert';

import 'package:spacex_mobile/data/models/rocket_model.dart';


List<ResponseData> dataModelFromJson(String str) => List<ResponseData>.from(json.decode(str).map((x) => ResponseData.fromJson(x)));

class RocketData {
  final List<RocketModel> rockets;

  RocketData({required this.rockets});

  // Método fromJson para RocketData
  factory RocketData.fromJson(Map<String, dynamic> json) {
    var rocketList = json['rockets'] as List;
    List<RocketModel> rockets =
        rocketList.map((i) => RocketModel.fromJson(i)).toList();

    return RocketData(
      rockets: rockets,
    );
  }
}

class ResponseData {
  final RocketData data;

  ResponseData({required this.data});

  // Método fromJson para ResponseData
  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      data: RocketData.fromJson(json['data']),
    );
  }
}
