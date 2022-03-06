import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("I Am Dog!"),
        elevation: 0,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "The yellow headband is Ji-Dong!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            const Text(
              "The pink headband is Ji-Dan!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 50),
            Image.asset("assets/images/i_am_dog.jpg"),
          ],
        ),
      ),
    ),
  ));
}