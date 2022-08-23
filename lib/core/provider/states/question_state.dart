import 'package:question_master/core/domain/question_state_data.dart';

abstract class QuestionState{
  final QuestionStateData data;

  QuestionState(this.data);

  QuestionState copyWith(QuestionStateData? data);
}

class QuestionStateWithData extends QuestionState{
  QuestionStateWithData(super.data);

  @override
  QuestionState copyWith(QuestionStateData? data) {
    return QuestionStateWithData(data ?? this.data);
  }
}