import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:question_master/core/domain/question_state_data.dart';
import 'package:question_master/core/domain/quiz_model.dart';
import 'package:question_master/core/provider/states/answered_state.dart';
import 'package:question_master/core/provider/states/question_state.dart';
import 'package:question_master/core/repository/question_repository.dart';
import 'package:question_master/core/utils/get_it.dart';
import 'package:riverpod/riverpod.dart';

final questionController = StateNotifierProvider.autoDispose<QuestionController, QuestionState>(
    (ref) => QuestionController(QuestionStateWithData(QuestionStateData.start())));

class QuestionController extends StateNotifier<QuestionState> {
  QuestionController(super.state) {
    _init();
  }

  QuestionRepositoryI get _questionRepo => getIt<QuestionRepositoryI>();

  Stream<List<QuizModel>?> get quizStream => _questionRepo.stream;

  final scrollController = PageController();
  final confettiController = ConfettiController(duration: const Duration(milliseconds: 900));

  void _init() {
    _questionRepo.load();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void checkAnswer(bool isCorrect) async {
    if (isCorrect) {
      //Update state to correct
      state = state.copyWith(state.data.copyWith(answeredState: AnsweredCorrect()));

      //Show confetti and then switch to next page
      confettiController.play();
      await Future.delayed(const Duration(milliseconds: 1100));
      confettiController.stop();
      scrollController.nextPage(duration: const Duration(milliseconds: 900), curve: Curves.decelerate);

      //Reset answered state and increase answered question count
      state = state.copyWith(
          state.data.copyWith(answeredState: AnsweredNone(), answeredQuestions: state.data.answeredQuestions + 1));
    } else {
      //Shows user that he made a mistake
      state = state.copyWith(state.data.copyWith(answeredState: AnsweredWrong()));
    }
  }

  void startQuizAgain() async {
    scrollController.animateToPage(0, duration: const Duration(milliseconds: 900), curve: Curves.decelerate);
    state = state.copyWith(state.data.copyWith(answeredState: AnsweredNone(), answeredQuestions: 0));
  }

  void onSkip() async {
    if (_questionRepo.data?.isEmpty ?? true) {
      debugPrint('Nothing has been loaded yet. Please load the question repo');
      return;
    }

    const animationDuration = Duration(milliseconds: 3000);

    scrollController.animateToPage(_questionRepo.data!.length,
        duration: animationDuration, curve: Curves.decelerate);

    final spliceDuration = Duration(milliseconds: animationDuration.inMilliseconds ~/ _questionRepo.data!.length);
    while(state.data.answeredQuestions < _questionRepo.data!.length){
      state = state.copyWith(state.data.copyWith(answeredQuestions: state.data.answeredQuestions+1));
      await Future.delayed(spliceDuration);
    }
  }
}
