import 'package:flutter/foundation.dart';
import 'package:question_master/core/domain/api_response.dart';
import 'package:question_master/core/repository/base_repository.dart';
import 'package:question_master/core/utils/extensions/list_extension.dart';

///Manages the dataflow of data lists via either a stream and a data object which holds all current list items
abstract class BaseDescendingPageRepository<T> extends BaseRepository<List<T>> {

  BaseDescendingPageRepository(Function(dynamic) parser) : super(parser) {
    data = [];
  }

  // Loads the initial set of entities.
  //This method manages fetching the necessary data and then giving it to the processLoad method do update the stream
  //The reason why you have to initialize it everytime within a new extended Repository is because you need to get firstly the data
  //from the api and then call processLoad to handle the data properly
  Future<List<T>> load();

  //[isReversed] reverses the order of the objects within the list data variable
  @protected
  List<T> processLoad(ApiResponse response, {bool isReversed = false}) {
    if (response.error != null) {
      controller.addError(response.error!);
      throw response.error!;
    } else {

      // Convert the data to objects..
      data = response.listData?.map((e) => elementParser(e) as T).toList() ?? [];
      data!.removeDuplicates();

      if (isReversed) {
        data = data!.reversed.toList();
      }

      // Notify the controller...
      notify();
      return data!;
    }
  }
  @protected
  List<T> processLoadData(List<Map<String, dynamic>> dataMap) {
    // Convert the data to objects..
    data = dataMap.map((e) => elementParser(e) as T).toList();
    data!.removeDuplicates();

    // Notify the controller...
    notify();
    return data!;
  }

  @override
  void notify() {
    controller.add(data);
  }
}