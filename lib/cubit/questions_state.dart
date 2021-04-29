part of 'questions_cubit.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class InitialState extends QuestionsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends QuestionsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends QuestionsState {
  LoadedState(this.questions);

  final Questions questions;

  @override
  List<Object> get props => [questions];
}

class ErrorState extends QuestionsState {
  @override
  List<Object> get props => [];
}
