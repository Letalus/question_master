import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:question_master/core/domain/quiz_model.dart';
import 'package:question_master/core/provider/controllers/question_controller.dart';
import 'package:question_master/ui/shared/qm_error_widget.dart';
import 'package:question_master/ui/shared/qm_loading_indicator.dart';
import 'package:question_master/ui/shared/qm_scaffold.dart';
import 'package:question_master/ui/widgets/question_screen/question_app_bar.dart';
import 'package:question_master/ui/widgets/question_screen/question_finished_tile.dart';
import 'package:question_master/ui/widgets/question_screen/question_tile.dart';

class QuestionScreen extends ConsumerStatefulWidget {
  static const String routeName = 'question screen';

  const QuestionScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  QuestionController get _questionControllerNoListener => ref.read(questionController.notifier);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuizModel>?>(
        stream: _questionControllerNoListener.quizStream,
        builder: (context, snapshot) {
          return QmScaffold(
            appBar: QuestionAppBar(correctAnswerCounter: ref.watch(questionController).data.answeredQuestions),
            body: Builder(builder: (context) {
              if (snapshot.hasError) {
                return QmErrorWidget(error: snapshot.error!);
              } else if (!snapshot.hasData) {
                return const QmLoadingIndicator();
              }

              final quizQuestions = snapshot.data!;

              return AnimatedBuilder(
                animation: _questionControllerNoListener.scrollController,
                builder: (context, _) => PageView.builder(
                    controller: _questionControllerNoListener.scrollController,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizQuestions.length + 1,
                    onPageChanged: (_) {
                      setState(() {});
                    },
                    itemBuilder: (context, index) {
                      bool isScrollControllerReady =
                          _questionControllerNoListener.scrollController.position.hasPixels &&
                              _questionControllerNoListener.scrollController.position.hasContentDimensions;

                      final questionData = ref.watch(questionController).data;
                      final page = isScrollControllerReady ? _questionControllerNoListener.scrollController.page! : 0.0;
                      final currentIndex = isScrollControllerReady ? index : 0;
                      if (index == quizQuestions.length) {
                        return QuestionFinishedTile(
                            page: page,
                            currentIndex: currentIndex,
                            startQuizAgain: _questionControllerNoListener.startQuizAgain);
                      } else {
                        return QuestionTile(
                            page: page,
                            currentIndex: currentIndex,
                            quizModel: quizQuestions[index],
                            onTapButton: _questionControllerNoListener.checkAnswer,
                            answeredState: questionData.answeredState,
                            confettiController: _questionControllerNoListener.confettiController);
                      }
                    }),
              );
            }),
          );
        });
  }
}
