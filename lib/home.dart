import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Space X App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _optionWidget(
              title: 'Ships',
              onTap: () => Navigator.pushNamed(context, '/ships'),
              color: Colors.lightBlue,
            ),
            _optionWidget(
              title: 'Rockets',
              onTap: () => Navigator.pushNamed(context, '/rockets'),
              color: Colors.redAccent,
            ),
            _optionWidget(
              title: 'Dragons',
              onTap: () => Navigator.pushNamed(context, '/dragons'),
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionWidget({
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 150,
        width: 200,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(fontSize: 22),
        )),
      ),
    );
  }
}
