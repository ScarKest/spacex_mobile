import 'package:spacex_mobile/domain/entities/dragon.dart';
import 'package:spacex_mobile/domain/entities/rocket.dart';
import 'package:spacex_mobile/domain/entities/ship.dart';

class Data {
  final DataClass data;

  Data({
    required this.data,
  });
}

class DataClass {
  final List<Dragon>? dragons;
  final List<Ship>? ships;
  final List<Rocket>? rockets;

  DataClass({
    this.dragons,
    this.rockets,
    this.ships,
  });
}
