import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizionare/components/button.dart';
import 'package:quizionare/screens/quiz_screen.dart';
import 'package:quizionare/styles/style.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome-screen';

  final List<Map<String, dynamic>> questions;

  WelcomeScreen(this.questions);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _name = TextEditingController();

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
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                  ),
                  controller: _name,
                ),
              ),
              ButtonPrimary(
                text: 'Start',
                onPressed: () {
                  print(_name.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        questions: widget.questions,
                        name: _name.text,
                      ),
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
