import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:quizionare/models/questions.dart';

class ApiQuestionProvider {
  final String _baseUrl = 'https://trivia.willfry.co.uk';
  final Dio _dio = Dio();

  Future<Questions> getQuestions() async {
    try {
      final response = await _dio.get('$_baseUrl/api/questions?limit=5');
      final Map<String, dynamic> data = {'data': response.data};
      return Questions.fromJson(data);
    } catch (error) {
      debugPrint('$error');
      return Questions.withError('$error');
    }
  }
}
