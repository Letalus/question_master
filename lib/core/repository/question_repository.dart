import 'package:question_master/core/domain/quiz_model.dart';
import 'package:question_master/core/repository/base_descending_page_repository.dart';
import 'package:question_master/core/utils/mock_data.dart';

abstract class QuestionRepositoryI extends BaseDescendingPageRepository<QuizModel>{
  QuestionRepositoryI():super((map)=>QuizModel.fromMap(map));
}

class MockedQuestionRepository extends QuestionRepositoryI {

  @override
  Future<List<QuizModel>> load() async{
    await Future.delayed(const Duration(milliseconds: 600));
    return processGetData(kQuizList);
  }
}

///Connection with the database and pulling questions from there implementation is still pending
class QuestionRepository extends QuestionRepositoryI {
  @override
  Future<List<QuizModel>> load() async{
    return [];
  }
}