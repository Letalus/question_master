import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:question_master/core/domain/api_response.dart';
import 'package:rxdart/rxdart.dart';

///Manages the main stream of the repository_models
///You can either listen with the stream for continuous changes or get the current Object with the data variable directly
class BaseRepository<T> {
  final _controller = BehaviorSubject<T?>();

  @protected
  StreamController get controller => _controller;

  Stream<T?> get stream => _controller.stream;

  T? _data;

  @protected
  set data(T? value) => _data = value;

  T? get data => _data;

  @protected
  final Function(dynamic) elementParser;

  BaseRepository(this.elementParser);

  @protected
  T processGet(ApiResponse response) {
    if (response.error != null) {
      controller.addError(response.error!);
      throw response.error!;
    } else {
      _data = elementParser(response.data) as T;
      notify();
      return data!;
    }
  }

  @protected
  T processGetData(T data) {
    _data = data;
    notify();
    return data!;
  }

  @protected
  bool processDelete(ApiResponse response) {
    if (response.error != null) {
      throw response.error!;
    } else {
      _data = null;
      notify();
      return true;
    }
  }

  void notify() {
    _controller.add(data);
  }

//Clears the current data
  void clear() {
    _controller.add(null);
    data = null;
  }

// Closes the underlying stream controller.
  void close() {
    _controller.close();
  }
}