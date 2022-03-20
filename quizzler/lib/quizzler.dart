import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:quizzler/quiz_brain.dart';

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  final _quizBrain = QuizBrain();
  final List<Widget> _scoreKeeper = [];

  void _checkAnswer(bool selectAnswer) {
    final isTrue = _quizBrain.checkAnswer(selectAnswer);
    setState(() {
      _scoreKeeper.add(
        Icon(
          isTrue ? Icons.check : Icons.close,
          color: isTrue ? Colors.green : Colors.red,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        _quizBrain.nextQuestionText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                      color: Colors.green,
                      child: const Text(
                        'True',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        _checkAnswer(true);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MaterialButton(
                      color: Colors.red,
                      child: const Text(
                        'False',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _checkAnswer(false);
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  children: _scoreKeeper,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,
