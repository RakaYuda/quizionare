import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  String? category;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  String? question;
  String? type;
  @JsonKey(ignore: true)
  String? error;

  Question(
    this.category,
    this.correctAnswer,
    this.incorrectAnswers,
    this.question,
    this.type,
  );

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Question.withError(this.error);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String toString() {
    return 'Question{question: $Question}';
  }
}
