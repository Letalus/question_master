import 'package:easy_localization/easy_localization.dart';
import 'package:question_master/const/app_strings.dart';
import 'package:question_master/const/asset_paths.dart';
import 'package:question_master/core/domain/quiz_model.dart';

//Shout out to https://levelup.gitconnected.com/101-beginner-facts-on-flutter-ba6587458c95 for the awesome facts about flutter ;)
final kQuizList = <QuizModel>[
  QuizModel(question: AppStrings.flutter_written_in.tr(), image: AssetPaths.image.flutter, isCorrect: true),
  QuizModel(question: AppStrings.due_to_its_simplicity.tr(), image: AssetPaths.image.happyBoy, isCorrect: true),
  QuizModel(
      question: AppStrings.flutter_offers_no_ui.tr(), image: AssetPaths.image.horseLaughing, isCorrect: false),
  QuizModel(question: AppStrings.flutter_hot_reload.tr(), image: AssetPaths.image.hot, isCorrect: true),
  QuizModel(
      question: AppStrings.flutter_good_community.tr(), image: AssetPaths.image.community, isCorrect: false),
  QuizModel(question: AppStrings.flutter_cross_platform.tr(), image: AssetPaths.image.code, isCorrect: true),
  QuizModel(
      question: AppStrings.using_flutter_write_code.tr(), image: AssetPaths.image.platform, isCorrect: false),
  QuizModel(
      question: AppStrings.flutter_offers_customizable.tr(),
      image: AssetPaths.image.architecture,
      isCorrect: true),
  QuizModel(
      question: AppStrings.structure_of_flutter_consist.tr(), image: AssetPaths.image.cplus, isCorrect: false),
  QuizModel(
      question: AppStrings.dart_based_platform_takes.tr(), image: AssetPaths.image.platform, isCorrect: false),
  QuizModel(
      question: AppStrings.flutter_app_development_relies_on.tr(),
      image: AssetPaths.image.frame,
      isCorrect: true),
  QuizModel(
      question: AppStrings.flutter_app_development_provides.tr(),
      image: AssetPaths.image.three_d,
      isCorrect: false),
  QuizModel(
      question: AppStrings.it_is_flutter_ready_to.tr(), image: AssetPaths.image.variety, isCorrect: true),
  QuizModel(question: AppStrings.since_flutter_is_new.tr(), image: AssetPaths.image.newImg, isCorrect: false),
  QuizModel(
      question: AppStrings.dart_is_object_oriented.tr(), image: AssetPaths.image.objectImg, isCorrect: true),
];