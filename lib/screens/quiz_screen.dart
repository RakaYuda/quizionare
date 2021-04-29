import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizionare/models/questions.dart';
import 'package:quizionare/screens/score_screen.dart';

class QuizScreen extends StatefulWidget {
  static const id = 'quiz-screen';

  final Questions questions;
  // final void Function() nextQuestion;

  QuizScreen({required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentNumber = 0;
  int _score = 0;
  bool _trueAnswer = false;
  String _choosenAnswer = '';

  @override
  void initState() {
    super.initState();
  }

  void nextQuestion() {
    if (_trueAnswer) {
      setState(() {
        _score++;
        _trueAnswer = false;
      });
    }
    if (_currentNumber != widget.questions.questions.length - 1) {
      setState(() {
        _currentNumber++;
      });
    } else {
      print('End Quiz');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(score: _score),
        ),
      );
    }
  }

  List<String> getListOption(int number) {
    List<String> list = [];
    Random random = new Random();
    int randomNumber = random.nextInt(4);

    List<String> listIncorrectAnswer =
        widget.questions.questions[number].incorrectAnswers!;

    for (var index = 0; index <= 2; index++) {
      list.add(listIncorrectAnswer[index]);
    }
    list.insert(
        randomNumber, widget.questions.questions[number].correctAnswer!);
    return list;
  }

  void chooseAnswer(String answer) {
    setState(() {
      _choosenAnswer = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Widget> list = listAnwerOption(
        widget.questions.questions[_currentNumber].correctAnswer!,
        _currentNumber);

    list.shuffle();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'Question :',
                ),
              ),
              Card(
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      widget.questions.questions[_currentNumber].question ??
                          'Error Question',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'Answer :',
                ),
              ),
              Column(children: list),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  child: Container(
                    height: 64,
                    width: double.infinity,
                    child: Center(child: Text('Next Question')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> listAnwerOption(String correctAnswer, int number) {
    List<Widget> list = [];
    final List<String> listOption = getListOption(number);
    for (String option in listOption) {
      list.add(
        Card(
          color: (_choosenAnswer == option)
              ? Colors.lightBlueAccent
              : Colors.white,
          child: InkWell(
            onTap: () {
              chooseAnswer(option);
              _trueAnswer = false;
            },
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  option,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }
}
