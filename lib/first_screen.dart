import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:question_master/quiz.dart';
import 'package:question_master/second_screen.dart';

//Shout out to https://levelup.gitconnected.com/101-beginner-facts-on-flutter-ba6587458c95 for the awesome facts about flutter ;)
final kQuizList = <Quiz>[
  Quiz(
      question: 'Flutter is written in the beautiful and mighty language dart',
      image: 'assets/images/flutter_image.png',
      isFirstAnswerTrue: true),
  Quiz(
      question:
          'Due to its simplicity ,high performance resulting from its development rich user interface, Flutter will have a significant impact on the development of high-quality, feature-packed mobile applications in the near future',
      image: 'assets/images/happy_boy.jpg',
      isFirstAnswerTrue: true),
  Quiz(
      question: 'Flutter offers no UI widgets compared to React and other front-End Frameworks!!',
      image: 'assets/images/horse_laughing.jpg',
      isFirstAnswerTrue: false),
  Quiz(
      question:
          'Flutter’s hot reload is the feature that allows it to offer faster performance. With it, the application gets compiled using the arm Rust library, making it closer to machine code and enabling it to run more quickly.',
      image: 'assets/images/hot_image.jpg',
      isFirstAnswerTrue: false),
  Quiz(
      question:
          'In Flutter there is a Good Community support where developers ask questions and get answered very quickly',
      image: 'assets/images/community_image.jpg',
      isFirstAnswerTrue: true),
  Quiz(
      question:
          'In contrast to most cross-platform frameworks, Flutter does rely on intermediate code representations or interpretations.',
      image: 'assets/images/code_image.jpg',
      isFirstAnswerTrue: false),
  Quiz(
      question:
          'Using Flutter, you can write code, manage, and run it across multiple platforms. For the developers, this saves time, money, and effort.',
      image: 'assets/images/platform_image.jpg',
      isFirstAnswerTrue: true),
  Quiz(
      question:
          'Flutter offers a customizable layered architecture that allows for highly customizable designs, expressive UIs, and slow rendering.',
      image: 'assets/images/architecture_image.jpg',
      isFirstAnswerTrue: false),
  Quiz(
      question:
          'The structure of Flutter consists of three layers:- Framework Dart, Engine C/C++,Embedder Platform-specific',
      image: 'assets/images/cplus_image.jpg',
      isFirstAnswerTrue: true),
  Quiz(
      question:
          'The Dart-based platform that takes care of app widgets, gestures, animations, illustrations, and materials',
      image: 'assets/images/platform_image.jpg',
      isFirstAnswerTrue: true),
  Quiz(
      question:
          'Flutter app development relies on multiple framework and platform for the development, deployment, and management of changes, rather than using separate platforms and frameworks for different purposes.',
      image: 'assets/images/frame_image.jpg',
      isFirstAnswerTrue: false),
  Quiz(
      question: 'Flutter app development provides widgets customized for Android, iOS, and Google Fuchsia.',
      image: 'assets/images/3d_image.jpg',
      isFirstAnswerTrue: true),
  Quiz(
      question:
          'It is because of Flutter’s ready-to-use widget library that developers can develop apps faster when using the framework. In addition to a wide variety of widgets, it does not include animations with which you can spice up your application.',
      image: 'assets/images/variety_image.jpg',
      isFirstAnswerTrue: false),
  Quiz(
      question:
          'Since Flutter is relatively new, the number of third-party libraries is small. Additionally, some widgets in Flutter are only available on one platform.',
      image: 'assets/images/new_image.jpg',
      isFirstAnswerTrue: true),
  Quiz(
      question:
          'Dart is an Object-oriented programming language, but it cannot compete with Java, JavaScript, or C# since it is still relatively new. As a result, developers hate it.',
      image: 'assets/images/object_image.jpg',
      isFirstAnswerTrue: false),
];

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
    final quizQuestions = kQuizList.take(1);
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/paradise_image.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Question master',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(correctAnswerCounter.toString(), style: TextStyle(color: Colors.yellow[800], fontSize: 20),),
                  Icon(Icons.star_rate_rounded, color: Colors.yellow[800],),
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
              bool isScrollControllerReady = scrollController.position.hasPixels && scrollController.position.hasContentDimensions;

              Widget child;

              if(index == quizQuestions.length){
                child =  Transform.rotate(
                  angle: isScrollControllerReady ? index-(scrollController.page??0) : 0,
                  child: Transform.translate(
                    offset: Offset((isScrollControllerReady ? index-(scrollController.page??0) : 0) * 500, (isScrollControllerReady ? index-(scrollController.page??0) : 0)*500),
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
                                    image: DecorationImage(image: AssetImage('assets/images/celebration_image.jpg'), fit: BoxFit.cover)),
                                constraints: BoxConstraints(minHeight: 100, maxHeight: 250),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                                child: Text(
                                  'Congratulations you\'ve completed the quiz!! You are truly a flutter master :)',
                                  style: TextStyle(fontSize: 20, height: 1.3),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 40),
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SecondScreen()));
                                  },
                                  child: Text('Wanna know more about the app?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20, color: Colors.yellow[800]),),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    scrollController.animateToPage(0, duration: Duration(milliseconds: 900), curve: Curves.decelerate);
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
                                            'Let\'s do it again!',
                                            style: TextStyle(fontSize: 20),
                                          ))))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }else{


                child =  Transform.rotate(
                  angle: isScrollControllerReady ? index-(scrollController.page??0) : 0,
                  child: Transform.translate(
                    offset: Offset((isScrollControllerReady ? index-(scrollController.page??0) : 0) * 500, (isScrollControllerReady ? index-(scrollController.page??0) : 0)*1000),
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
                                    image: DecorationImage(image: AssetImage(kQuizList[index].image), fit: BoxFit.cover)),
                                constraints: BoxConstraints(minHeight: 100, maxHeight: 250),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                                child: Text(
                                  kQuizList[index].question,
                                  style: TextStyle(fontSize: 20, height: 1.3),
                                ),
                              ),
                              if(isAnsweredWrong)Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 40),
                                child: Text(
                                  'Oops wrong, try again :)',
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
                                        'Awesome!',
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
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)))),
                                            backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                        child: SizedBox(
                                            height: 50,
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'False',
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
                                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))))),
                                        child: SizedBox(
                                            height: 50,
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'True',
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
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 700
                    ),
                    child: child),
              );
            }),
      ),
    );
  }
}
