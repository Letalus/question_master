import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/asset_paths.dart';
import 'package:question_master/core/domain/quiz_model.dart';
import 'package:question_master/core/services/navigation_service.dart';
import 'package:question_master/ui/screens/explain_screen.dart';

//Shout out to https://levelup.gitconnected.com/101-beginner-facts-on-flutter-ba6587458c95 for the awesome facts about flutter ;)
final kQuizList = <QuizModel>[
  QuizModel(question: AppStrings.flutter_written_in.tr(), image: AssetPaths.image.flutter, isFirstAnswerTrue: true),
  QuizModel(question: AppStrings.due_to_its_simplicity.tr(), image: AssetPaths.image.happyBoy, isFirstAnswerTrue: true),
  QuizModel(
      question: AppStrings.flutter_offers_no_ui.tr(), image: AssetPaths.image.horseLaughing, isFirstAnswerTrue: false),
  QuizModel(question: AppStrings.flutter_hot_reload.tr(), image: AssetPaths.image.hot, isFirstAnswerTrue: false),
  QuizModel(
      question: AppStrings.flutter_good_community.tr(), image: AssetPaths.image.community, isFirstAnswerTrue: true),
  QuizModel(question: AppStrings.flutter_cross_platform.tr(), image: AssetPaths.image.code, isFirstAnswerTrue: false),
  QuizModel(
      question: AppStrings.using_flutter_write_code.tr(), image: AssetPaths.image.platform, isFirstAnswerTrue: true),
  QuizModel(
      question: AppStrings.flutter_offers_customizable.tr(),
      image: AssetPaths.image.architecture,
      isFirstAnswerTrue: false),
  QuizModel(
      question: AppStrings.structure_of_flutter_consist.tr(), image: AssetPaths.image.cplus, isFirstAnswerTrue: true),
  QuizModel(
      question: AppStrings.dart_based_platform_takes.tr(), image: AssetPaths.image.platform, isFirstAnswerTrue: true),
  QuizModel(
      question: AppStrings.flutter_app_development_relies_on.tr(),
      image: AssetPaths.image.frame,
      isFirstAnswerTrue: false),
  QuizModel(
      question: AppStrings.flutter_app_development_provides.tr(),
      image: AssetPaths.image.three_d,
      isFirstAnswerTrue: true),
  QuizModel(
      question: AppStrings.it_is_flutter_ready_to.tr(), image: AssetPaths.image.variety, isFirstAnswerTrue: false),
  QuizModel(question: AppStrings.since_flutter_is_new.tr(), image: AssetPaths.image.newImg, isFirstAnswerTrue: true),
  QuizModel(
      question: AppStrings.dart_is_object_oriented.tr(), image: AssetPaths.image.objectImg, isFirstAnswerTrue: false),
];

class QuestionScreen extends StatefulWidget {
  static const String routeName = 'question screen';

  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final scrollController = PageController();

  int correctAnswerCounter = 0;

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
  }

  final confettiController = ConfettiController(duration: Duration(milliseconds: 900));
  bool isAnsweredCorrect = false;
  bool isAnsweredWrong = false;

  @override
  Widget build(BuildContext context) {
    final quizQuestions = kQuizList.take(kQuizList.length);
    return DecoratedBox(
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(AssetPaths.image.paradise), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            AppStrings.question_master.tr(),
            style: TextStyle(color: Colors.black),
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
        body: PageView.builder(
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
                                    NavigationService.instance.navigateTo(ExplainScreen.routeName);
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
                                    image:
                                        DecorationImage(image: AssetImage(kQuizList[index].image), fit: BoxFit.cover)),
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
                                                      duration: Duration(milliseconds: 900), curve: Curves.decelerate);
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
                                                      duration: Duration(milliseconds: 900), curve: Curves.decelerate);
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
                                                          BorderRadius.only(bottomRight: Radius.circular(20))))),
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
            }),
      ),
    );
  }
}
