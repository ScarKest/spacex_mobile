import 'dart:convert';

import 'package:spacex_mobile/data/models/dragon_model.dart';
import 'package:http/http.dart' as http;

abstract class DragonsRemoteDatasource {
  Future<DragonModel> getDragons();
}

class DragonsRemoteDatasourceImpl implements DragonsRemoteDatasource {
  final http.Client client;

  DragonsRemoteDatasourceImpl({required this.client});

  @override
  Future<DragonModel> getDragons() async {
    const String query = r'''
                        query Dragons {
                           dragons {
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
        return dragonModelFromJson(response.body);
      } catch (_, __) {
        throw UnimplementedError();
      }
    }

    throw UnimplementedError();
  }
}
