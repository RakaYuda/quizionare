import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizionare/models/questions.dart';
import 'package:quizionare/screens/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = 'welcome-screen';

  final Questions questions;

  WelcomeScreen({required this.questions});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Quizionare App',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                onPressed: () {
                  print(questions.questions[0]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(questions: questions),
                    ),
                  );
                },
                child: Text(
                  'Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
