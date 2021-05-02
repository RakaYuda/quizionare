import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizionare/components/button.dart';
import 'package:quizionare/screens/quiz_screen.dart';
import 'package:quizionare/styles/style.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = 'welcome-screen';

  final List<Map<String, dynamic>> questions;

  WelcomeScreen(this.questions);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to \n Quizionare App',
                  textAlign: TextAlign.center,
                  style: kTextPrimary.copyWith(
                    fontSize: 32,
                  )),
              SizedBox(
                height: 64,
              ),
              ButtonPrimary(
                text: 'Start',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(questions: questions),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
