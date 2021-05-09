import 'package:flutter/material.dart';
import 'package:quizionare/components/button.dart';
import 'package:quizionare/screens/score_screen.dart';

class QuizScreen extends StatefulWidget {
  static const id = 'quiz-screen';

  final List<Map<String, dynamic>> questions;
  final String name;

  QuizScreen({required this.questions, required this.name});

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
    if (_currentNumber != widget.questions.length - 1) {
      setState(() {
        _currentNumber++;
      });
    } else {
      // print('End Quiz');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
            score: _score,
            name: widget.name,
          ),
        ),
      );
    }
  }

  void chooseAnswer(String answer) {
    setState(() {
      _choosenAnswer = answer;
    });
  }

  List<String> getListOption(int number) {
    Map<String, dynamic> mapQuestion = widget.questions[number];
    List<String> listOption = mapQuestion['list_option'] ?? [];
    return listOption;
  }

  String getQuestion(int number) {
    Map<String, dynamic> mapQuestion = widget.questions[number];
    String question = mapQuestion['question'];
    return question;
  }

  String getAnswer(int number) {
    Map<String, dynamic> mapQuestion = widget.questions[number];
    String question = mapQuestion['answer'];
    return question;
  }

  List<Widget> listAnwerOption(String correctAnswer, List<String> listOption) {
    List<Widget> list = [];
    for (String option in listOption) {
      list.add(
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          color: Colors.white,
          child: InkWell(
            onTap: () {
              chooseAnswer(option);
              if (_choosenAnswer == correctAnswer) {
                _trueAnswer = true;
              } else {
                _trueAnswer = false;
              }
            },
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (_choosenAnswer == option)
                      ? Color(0xFF2CDDCC)
                      : Colors.grey.shade200,
                ),
                child: Center(
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('$option'),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                    child: Text(
                      getQuestion(_currentNumber),
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
              Column(
                  children: listAnwerOption(getAnswer(_currentNumber),
                      getListOption(_currentNumber))),
              SizedBox(height: 24),
              ButtonPrimary(
                text: 'Next Question',
                onPressed: nextQuestion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
