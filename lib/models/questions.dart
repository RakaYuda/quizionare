import 'package:json_annotation/json_annotation.dart';

part 'questions.g.dart';

@JsonSerializable()
class Questions {
  @JsonKey(name: "data")
  List<Question> questions = [];
  @JsonKey(ignore: true)
  String? error;

  Questions(
    this.questions,
  );

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);

  Questions.withError(this.error);

  Map<String, dynamic> toJson() => _$QuestionsToJson(this);

  @override
  String toString() {
    return 'Questions{questions: $Questions}';
  }
}

@JsonSerializable()
class Question {
  String? category;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  String? question;
  String? type;

  Question(
    this.category,
    this.correctAnswer,
    this.incorrectAnswers,
    this.question,
    this.type,
  );

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String toString() {
    return 'Question{question: $Question}';
  }
}
