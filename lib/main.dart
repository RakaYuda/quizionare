import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizionare/api/repository/api_question_repository.dart';
import 'package:quizionare/cubit/questions_cubit.dart';
import 'package:quizionare/models/questions.dart';
import 'package:quizionare/screens/home_page.dart';
import 'package:quizionare/screens/score_screen.dart';
import 'package:quizionare/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(
              questions: Questions([]),
            ),
        HomeScreen.id: (context) => HomeScreen(),
        ScoreScreen.id: (context) => ScoreScreen(
              score: 0,
            ),
      },
      // home: HomeScreen()
      home: BlocProvider<QuestionsCubit>(
        create: (context) =>
            QuestionsCubit(questionRepository: ApiQuestionRepository()),
        child: HomeScreen(),
      ),
    );
  }
}
