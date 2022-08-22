import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/asset_paths.dart';
import 'package:question_master/core/domain/quiz_model.dart';
import 'package:question_master/core/repository/question_repository.dart';
import 'package:question_master/core/services/navigation_service.dart';
import 'package:question_master/core/utils/get_it.dart';
import 'package:question_master/core/utils/mock_data.dart';
import 'package:question_master/ui/screens/explanation_screen.dart';

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

  final confettiController = ConfettiController(duration: Duration(milliseconds: 900));
  bool isAnsweredCorrect = false;
  bool isAnsweredWrong = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuizModel>?>(
        stream: _questionRepo.stream,
        builder: (context, snapshot) {
          return DecoratedBox(
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(AssetPaths.image.paradise), fit: BoxFit.cover)),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  AppStrings.question_master.tr(),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          correctAnswerCounter.toString(),
                          style: TextStyle(color: Colors.yellow[800], fontSize: 20),
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow[800],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: Builder(builder: (context) {
                if (snapshot.hasError) {
                  return Align(
                    alignment: Alignment.center,
                    child: Text('Some error happened:\n${snapshot.error!}'),
                  );
                } else if (!snapshot.hasData) {
                  return const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                }

                final quizQuestions = snapshot.data!;

                return PageView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: quizQuestions.length + 1,
                    onPageChanged: (_) {
                      setState(() {});
                    },
                    itemBuilder: (context, index) {
                      bool isScrollControllerReady =
                          scrollController.position.hasPixels && scrollController.position.hasContentDimensions;

                      Widget child;

                      if (index == quizQuestions.length) {
                        child = Transform.rotate(
                          angle: isScrollControllerReady ? index - (scrollController.page ?? 0) : 0,
                          child: Transform.translate(
                            offset: Offset((isScrollControllerReady ? index - (scrollController.page ?? 0) : 0) * 500,
                                (isScrollControllerReady ? index - (scrollController.page ?? 0) : 0) * 500),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(24),
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                            image: DecorationImage(
                                                image: AssetImage(AssetPaths.image.celebration), fit: BoxFit.cover)),
                                        constraints: BoxConstraints(minHeight: 100, maxHeight: 250),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                                        child: Text(
                                          AppStrings.congratulation.tr(),
                                          style: TextStyle(fontSize: 20, height: 1.3),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 40),
                                        child: TextButton(
                                          onPressed: () {
                                            NavigationService.instance.navigateTo(ExplanationScreen.routeName);
                                          },
                                          child: Text(
                                            AppStrings.wanna_know_more.tr(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 20, color: Colors.yellow[800]),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () async {
                                            scrollController.animateToPage(0,
                                                duration: Duration(milliseconds: 900), curve: Curves.decelerate);
                                            setState(() {
                                              correctAnswerCounter = 0;
                                            });
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
                                          ),
                                          child: SizedBox(
                                              height: 50,
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    AppStrings.lets_do_it_again.tr(),
                                                    style: TextStyle(fontSize: 20),
                                                  ))))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        child = Transform.rotate(
                          angle: isScrollControllerReady ? index - (scrollController.page ?? 0) : 0,
                          child: Transform.translate(
                            offset: Offset((isScrollControllerReady ? index - (scrollController.page ?? 0) : 0) * 500,
                                (isScrollControllerReady ? index - (scrollController.page ?? 0) : 0) * 1000),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(24),
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                            image: DecorationImage(
                                                image: AssetImage(kQuizList[index].image), fit: BoxFit.cover)),
                                        constraints: BoxConstraints(minHeight: 100, maxHeight: 250),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                                        child: Text(
                                          kQuizList[index].question,
                                          style: TextStyle(fontSize: 20, height: 1.3),
                                        ),
                                      ),
                                      if (isAnsweredWrong)
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 40),
                                          child: Text(
                                            AppStrings.oops_wrong.tr(),
                                            style: TextStyle(fontSize: 20, color: Colors.red),
                                          ),
                                        ),
                                      isAnsweredCorrect
                                          ? Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Spacer(),
                                                    ConfettiWidget(
                                                        confettiController: confettiController,
                                                        numberOfParticles: 200,
                                                        blastDirection: pi * 1.5,
                                                        emissionFrequency: 0.0,
                                                        maxBlastForce: 30,
                                                        minBlastForce: 5,
                                                        gravity: .1,
                                                        child: SizedBox()),
                                                    Spacer()
                                                  ],
                                                ),
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                                                      color: Theme.of(context).primaryColor),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      AppStrings.awesome.tr(),
                                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                      onPressed: () async {
                                                        if (!kQuizList[index].isFirstAnswerTrue) {
                                                          confettiController.play();
                                                          setState(() {
                                                            isAnsweredCorrect = true;
                                                            isAnsweredWrong = false;
                                                          });
                                                          await Future.delayed(Duration(milliseconds: 1100));
                                                          confettiController.stop();
                                                          scrollController.nextPage(
                                                              duration: Duration(milliseconds: 900),
                                                              curve: Curves.decelerate);
                                                          correctAnswerCounter++;
                                                          setState(() {
                                                            isAnsweredCorrect = false;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            isAnsweredWrong = true;
                                                          });
                                                        }
                                                      },
                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.only(bottomLeft: Radius.circular(20)))),
                                                          backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                                      child: SizedBox(
                                                          height: 50,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                AppStrings.false_tag.tr(),
                                                                style: TextStyle(fontSize: 20),
                                                              )))),
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                      onPressed: () async {
                                                        if (kQuizList[index].isFirstAnswerTrue) {
                                                          confettiController.play();
                                                          setState(() {
                                                            isAnsweredCorrect = true;
                                                            isAnsweredWrong = false;
                                                          });
                                                          await Future.delayed(Duration(milliseconds: 1100));
                                                          confettiController.stop();
                                                          scrollController.nextPage(
                                                              duration: Duration(milliseconds: 900),
                                                              curve: Curves.decelerate);
                                                          correctAnswerCounter++;
                                                          setState(() {
                                                            isAnsweredCorrect = false;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            isAnsweredWrong = true;
                                                          });
                                                        }
                                                      },
                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomRight: Radius.circular(20))))),
                                                      child: SizedBox(
                                                          height: 50,
                                                          child: Align(
                                                              alignment: Alignment.center,
                                                              child: Text(
                                                                AppStrings.true_tag.tr(),
                                                                style: TextStyle(fontSize: 20),
                                                              )))),
                                                ),
                                              ],
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      return Align(
                        alignment: Alignment.center,
                        child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 700), child: child),
                      );
                    });
              }),
            ),
          );
        });
  }
}
