import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizionare/api/repository/api_question_repository.dart';
import 'package:quizionare/models/questions.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit({required this.questionRepository}) : super(InitialState()) {
    getQuestions();
  }

  final ApiQuestionRepository questionRepository;

  void getQuestions() async {
    try {
      emit(LoadingState());
      final questions = await questionRepository.fetchQuestions();
      emit(LoadedState(questions));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void resetNewQuestions() {
    emit(InitialState());
    getQuestions();
  }
}
