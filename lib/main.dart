import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizionare/api/repository/api_question_repository.dart';
import 'package:quizionare/cubit/questions_cubit.dart';
import 'package:quizionare/screens/home_screen.dart';
import 'package:quizionare/screens/score_screen.dart';
import 'package:quizionare/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionsCubit>(
      create: (context) =>
          QuestionsCubit(questionRepository: ApiQuestionRepository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen([]),
          HomeScreen.id: (context) => HomeScreen(),
          ScoreScreen.id: (context) => ScoreScreen(
                score: 0,
                name: '-',
              ),
        },
        home: HomeScreen(),
      ),
    );
  }
}
