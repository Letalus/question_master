import 'package:question_master/core/provider/states/answered_state.dart';

class QuestionStateData {
  final int answeredQuestions;
  final AnsweredState answeredState;

//<editor-fold desc="Data Methods">

  const QuestionStateData({
    required this.answeredQuestions,
    required this.answeredState,
  });

  factory QuestionStateData.start() {
    return QuestionStateData(answeredQuestions: 0, answeredState: AnsweredNone());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionStateData &&
          runtimeType == other.runtimeType &&
          answeredQuestions == other.answeredQuestions &&
          answeredState == other.answeredState);

  @override
  int get hashCode => answeredQuestions.hashCode ^ answeredState.hashCode;

  @override
  String toString() {
    return 'QuestionStateData{' ' answeredQuestions: $answeredQuestions,' ' answeredState: $answeredState,' '}';
  }

  QuestionStateData copyWith({
    int? answeredQuestions,
    AnsweredState? answeredState,
  }) {
    return QuestionStateData(
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      answeredState: answeredState ?? this.answeredState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answeredQuestions': answeredQuestions,
      'answeredState': answeredState,
    };
  }

  factory QuestionStateData.fromMap(Map<String, dynamic> map) {
    return QuestionStateData(
      answeredQuestions: map['answeredQuestions'] as int,
      answeredState: map['answeredState'] as AnsweredState,
    );
  }

//</editor-fold>
}
