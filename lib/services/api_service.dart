import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quizionare/datas/data.dart';

import 'package:quizionare/models/question.dart';

class ApiQuizService {
  final String _baseUrl = 'https://trivia.willfry.co.uk';
  final Dio _dio = Dio();

  Future<Question> getQuestions() async {
    try {
      final response = await _dio.get('$_baseUrl/api/questions?limit=5');
      print(response.data);
      return Question.fromJson(response.data.root);
    } catch (error) {
      debugPrint('$error');
      return Question.withError('$error');
    }
  }
}

List getListDataQuiz() {
  final data = dataQuiz;
  return data;
}
