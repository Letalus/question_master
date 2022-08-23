import 'package:easy_localization/easy_localization.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/asset_paths.dart';
import 'package:question_master/core/domain/quiz_model.dart';

//Shout out to https://levelup.gitconnected.com/101-beginner-facts-on-flutter-ba6587458c95 for the awesome facts about flutter ;)
final kQuizList = <QuizModel>[
  QuizModel(question: AppStrings.flutter_written_in.tr(), image: AssetPaths.image.flutter, correctAnswerPosition: 0),
  QuizModel(question: AppStrings.due_to_its_simplicity.tr(), image: AssetPaths.image.happyBoy, correctAnswerPosition: 0),
  QuizModel(
      question: AppStrings.flutter_offers_no_ui.tr(), image: AssetPaths.image.horseLaughing, correctAnswerPosition: 1),
  QuizModel(question: AppStrings.flutter_hot_reload.tr(), image: AssetPaths.image.hot, correctAnswerPosition: 1),
  QuizModel(
      question: AppStrings.flutter_good_community.tr(), image: AssetPaths.image.community, correctAnswerPosition: 0),
  QuizModel(question: AppStrings.flutter_cross_platform.tr(), image: AssetPaths.image.code, correctAnswerPosition: 1),
  QuizModel(
      question: AppStrings.using_flutter_write_code.tr(), image: AssetPaths.image.platform, correctAnswerPosition: 0),
  QuizModel(
      question: AppStrings.flutter_offers_customizable.tr(),
      image: AssetPaths.image.architecture,
      correctAnswerPosition: 1),
  QuizModel(
      question: AppStrings.structure_of_flutter_consist.tr(), image: AssetPaths.image.cplus, correctAnswerPosition: 0),
  QuizModel(
      question: AppStrings.dart_based_platform_takes.tr(), image: AssetPaths.image.platform, correctAnswerPosition: 0),
  QuizModel(
      question: AppStrings.flutter_app_development_relies_on.tr(),
      image: AssetPaths.image.frame,
      correctAnswerPosition: 1),
  QuizModel(
      question: AppStrings.flutter_app_development_provides.tr(),
      image: AssetPaths.image.three_d,
      correctAnswerPosition: 0),
  QuizModel(
      question: AppStrings.it_is_flutter_ready_to.tr(), image: AssetPaths.image.variety, correctAnswerPosition: 1),
  QuizModel(question: AppStrings.since_flutter_is_new.tr(), image: AssetPaths.image.newImg, correctAnswerPosition: 0),
  QuizModel(
      question: AppStrings.dart_is_object_oriented.tr(), image: AssetPaths.image.objectImg, correctAnswerPosition: 1),
];