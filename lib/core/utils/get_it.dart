import 'package:get_it/get_it.dart';
import 'package:question_master/const/app_constants.dart';
import 'package:question_master/core/repository/question_repository.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<QuestionRepositoryI>(
      () => AppConstants.isTest ? MockedQuestionRepository() : QuestionRepository());
}
