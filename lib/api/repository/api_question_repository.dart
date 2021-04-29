import 'package:quizionare/api/provider/api_question_provider.dart';
import 'package:quizionare/models/questions.dart';

class ApiQuestionRepository {
  final ApiQuestionProvider _apiQuestionProvider = ApiQuestionProvider();

  Future<Questions> fetchQuestions() => _apiQuestionProvider.getQuestions();
}
