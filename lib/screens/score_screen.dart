import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quizionare/components/button.dart';
import 'package:quizionare/cubit/questions_cubit.dart';
import 'package:quizionare/screens/home_screen.dart';
import 'package:quizionare/styles/style.dart';

class ScoreScreen extends StatelessWidget {
  static const id = 'score-screen';

  final int score;

  ScoreScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final QuestionsCubit _questionCubit =
        BlocProvider.of<QuestionsCubit>(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => _questionCubit,
        child: Stack(
          children: [
            Center(
              child: Lottie.asset(
                'animation/confetti.json',
                repeat: true,
                reverse: false,
                animate: true,
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Score : ',
                    textAlign: TextAlign.center,
                    style: kTextPrimary.copyWith(
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    score.toString(),
                    textAlign: TextAlign.center,
                    style: kTextPrimary.copyWith(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  ButtonPrimary(
                    text: 'Back to Home',
                    onPressed: () {
                      context.read<QuestionsCubit>().resetNewQuestions();
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
