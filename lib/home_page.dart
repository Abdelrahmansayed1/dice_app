import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num = 1;
  Widget content = Image.asset("lib/Assets/dice-images/dice-1.png");
  void rollDice() {
    setState(() {
      num = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: const [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[800]!,
              Colors.indigo[700]!,
              Colors.indigo[600]!,
              Colors.indigo[400]!,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("lib/Assets/dice-images/dice-$num.png",
                  width: 200, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: rollDice,
              style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white)),
              child: const Text(
                "Roll Dice",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
