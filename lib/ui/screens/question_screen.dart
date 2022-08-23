import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:question_master/core/domain/quiz_model.dart';
import 'package:question_master/core/repository/question_repository.dart';
import 'package:question_master/core/utils/get_it.dart';
import 'package:question_master/ui/shared/qm_error_widget.dart';
import 'package:question_master/ui/shared/qm_loading_indicator.dart';
import 'package:question_master/ui/shared/qm_scaffold.dart';
import 'package:question_master/ui/widgets/question_screen/question_app_bar.dart';
import 'package:question_master/ui/widgets/question_screen/question_finished_tile.dart';
import 'package:question_master/ui/widgets/question_screen/question_tile.dart';

class QuestionScreen extends StatefulWidget {
  static const String routeName = 'question screen';

  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final scrollController = PageController();

  int correctAnswerCounter = 0;

  QuestionRepositoryI get _questionRepo => getIt<QuestionRepositoryI>();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {});
    });

    _questionRepo.load();
  }

  final confettiController = ConfettiController(duration: const Duration(milliseconds: 900));
  bool isAnsweredCorrect = false;
  bool isAnsweredWrong = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuizModel>?>(
        stream: _questionRepo.stream,
        builder: (context, snapshot) {
          return QmScaffold(
            appBar: QuestionAppBar(correctAnswerCounter: correctAnswerCounter),
            body: Builder(builder: (context) {
              if (snapshot.hasError) {
                return QmErrorWidget(error: snapshot.error!);
              } else if (!snapshot.hasData) {
                return const QmLoadingIndicator();
              }

              final quizQuestions = snapshot.data!;

              return PageView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizQuestions.length + 1,
                  onPageChanged: (_) {
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    bool isScrollControllerReady =
                        scrollController.position.hasPixels && scrollController.position.hasContentDimensions;

                    if (!isScrollControllerReady) return Container();

                    if (index == quizQuestions.length) {
                      return QuestionFinishedTile(
                          page: scrollController.page!, currentIndex: index, startQuizAgain: _startQuizAgain);
                    } else {
                      return QuestionTile(
                          page: scrollController.page!,
                          currentIndex: index,
                          quizModel: quizQuestions[index],
                          onTapButton: _checkAnswer,
                          isAnsweredWrong: isAnsweredWrong,
                          isAnsweredCorrect: isAnsweredCorrect,
                          confettiController: confettiController);
                    }
                  });
            }),
          );
        });
  }

  void _checkAnswer(bool isCorrect) async {
    if (isCorrect) {
      confettiController.play();
      setState(() {
        isAnsweredCorrect = true;
        isAnsweredWrong = false;
      });
      await Future.delayed(const Duration(milliseconds: 1100));
      confettiController.stop();
      scrollController.nextPage(duration: const Duration(milliseconds: 900), curve: Curves.decelerate);
      correctAnswerCounter++;
      setState(() {
        isAnsweredCorrect = false;
      });
    } else {
      setState(() {
        isAnsweredWrong = true;
      });
    }
  }

  void _startQuizAgain() async {
    scrollController.animateToPage(0, duration: const Duration(milliseconds: 900), curve: Curves.decelerate);
    setState(() {
      correctAnswerCounter = 0;
    });
  }
}
