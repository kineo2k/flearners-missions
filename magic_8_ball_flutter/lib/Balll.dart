import 'dart:math';

import 'package:flutter/material.dart';

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int _ballNumber = 1;
  Color _backgroundColor = Colors.blue;

  void _handleImageTap() {
    final rng = Random();
    setState(() {
      _ballNumber = rng.nextInt(5) + 1;
      _backgroundColor = Color((rng.nextDouble() * 0xffffff).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Center(
        child: TextButton(
          style: const ButtonStyle(
            splashFactory: NoSplash.splashFactory
          ),
          onPressed: _handleImageTap,
          child: Image.asset("images/ball$_ballNumber.png"),
        ),
      ),
    );
  }
}
