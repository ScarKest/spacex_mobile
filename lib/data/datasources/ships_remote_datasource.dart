import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:spacex_mobile/data/models/ship_model.dart';

abstract class ShipsRemoteDatasource {
  Future<ShipModel> getShips();
}

class ShipsRemoteDatasourceImpl implements ShipsRemoteDatasource {
  final http.Client client;

  ShipsRemoteDatasourceImpl({required this.client});

  @override
  Future<ShipModel> getShips() async {
    const String query = r'''
                        query Ships {
                           ships {
                            name
                            image
                          }
                        }
                        ''';

    final response = await client.post(
        Uri.parse('https://spacex-production.up.railway.app/'),
        body: jsonEncode({'query': query}),
        headers: {
          'Content-Type': 'application/json',
        });
    log(response.toString());

    if (response.statusCode == 200) {
      try {
        return shipModelFromJson(response.body);
      } catch (_, __) {
        throw UnimplementedError();
      }
    }

    throw UnimplementedError();
  }
}
