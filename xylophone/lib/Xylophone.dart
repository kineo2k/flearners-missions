import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final _keyColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...List.generate(7, (index) => _soundKey(index)),
            ],
          ),
        ),
      ),
    );
  }

  void _playSound(int soundNumber) {
    AudioCache audioCache = AudioCache();
    audioCache.play("note$soundNumber.wav");
  }

  Widget _soundKey(int index) {
    return Expanded(
      child: MaterialButton(
        color: _keyColors[index],
        enableFeedback: false,
        onPressed: () => _playSound(index + 1),
      ),
    );
  }
}
