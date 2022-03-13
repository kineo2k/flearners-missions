import 'package:flutter/material.dart';

import 'Balll.dart';

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ask Me Anything"),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Ball(),
      ),
    );
  }
}
