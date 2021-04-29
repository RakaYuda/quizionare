import 'package:flutter/material.dart';
import 'package:quizionare/screens/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  static const id = 'score-screen';

  final int score;

  ScoreScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Score'),
            SizedBox(
              height: 16,
            ),
            Text(score.toString()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
              onPressed: () {
                // print(questions.questions[0]);
                Navigator.pushNamed(context, WelcomeScreen.id);
              },
              child: Text(
                'Back to Home',
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
    );
  }
}
