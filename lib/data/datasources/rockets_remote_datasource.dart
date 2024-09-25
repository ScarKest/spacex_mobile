import 'dart:convert';

import 'package:spacex_mobile/data/models/rocket_model.dart';
import 'package:http/http.dart' as http;

abstract class RocketsRemoteDatasource {
  Future<RocketModel> getRockets();
}

class RocketsRemoteDatasourceImpl implements RocketsRemoteDatasource {
  final http.Client client;

  RocketsRemoteDatasourceImpl({required this.client});

  @override
  Future<RocketModel> getRockets() async {
    const String query = r'''
                        query Rockets {
                           rockets {
                             id
                             name
                           }
                        }
                        ''';

    final response = await client.post(
        Uri.parse('https://spacex-production.up.railway.app/'),
        body: jsonEncode({'query': query}),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      try {
        return rocketModelFromJson(response.body);
      } catch (_, __) {
        throw UnimplementedError();
      }
    }

    throw UnimplementedError();
  }
}
