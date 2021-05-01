import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizionare/cubit/questions_cubit.dart';
import 'package:quizionare/models/questions.dart';
import 'package:quizionare/screens/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            Questions _questions = state.questions;
            List<Map<String, dynamic>> tempQuestions = [];

            _questions.questions.forEach((question) {
              List<String> listOption = [];

              Map<String, dynamic> tempRow = {
                'question': question.question ?? '',
                'list_option': listOption,
                'answer': question.correctAnswer,
              };

              question.incorrectAnswers!.forEach((incorrect) {
                if (tempRow['list_option'].length <= 2) {
                  listOption.add(incorrect);
                }
              });

              listOption.add(question.correctAnswer!);
              tempRow['list_option'].shuffle();

              tempQuestions.add(tempRow);
            });

            print(tempQuestions[0]);

            return WelcomeScreen(tempQuestions);
          } else {
            return Container(
              child: Center(
                child: Text('Empty Data Question'),
              ),
            );
          }
        },
      ),
    );
  }
}
