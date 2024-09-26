import 'package:flutter/material.dart';
import 'package:spacex_mobile/app.dart';
import 'injection.dart' as di;

void main() async {
  runApp(const MyApp());

  await di.init();
}
