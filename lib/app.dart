import 'package:flutter/material.dart';
import 'package:spacex_mobile/home.dart';
import 'package:spacex_mobile/presentation/dragons/dragons_screen.dart';
import 'package:spacex_mobile/presentation/rockets/rockets_screen.dart';
import 'package:spacex_mobile/presentation/ships/ship_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        '/dragons': (context) => const DragonsScreen(),
        '/ships': (context) => const ShipsScreen(),
        '/rockets': (context) => const RocketsScreen()
      },
    );
  }
}
