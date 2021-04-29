// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questions _$QuestionsFromJson(Map<String, dynamic> json) {
  return Questions(
    (json['data'] as List<dynamic>)
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'data': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    json['category'] as String?,
    json['correctAnswer'] as String?,
    (json['incorrectAnswers'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    json['question'] as String?,
    json['type'] as String?,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'category': instance.category,
      'correctAnswer': instance.correctAnswer,
      'incorrectAnswers': instance.incorrectAnswers,
      'question': instance.question,
      'type': instance.type,
    };
