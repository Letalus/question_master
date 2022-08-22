

/// The [ApiResponse] is the core wrapper for all responses from the server. If
/// the response cannot be parsed into the wrapper something went totally wrong.
class ApiResponse {
  // Something went wrong in the server or the request was incorrect
  final dynamic error;

  // The actual data;
  final dynamic data;
  final List<dynamic>? listData;

  bool get hasError => error != null;

//<editor-fold desc="Data Methods">

  const ApiResponse({
    required this.error,
    required this.data,
    this.listData,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApiResponse &&
          runtimeType == other.runtimeType &&
          error == other.error &&
          data == other.data &&
          listData == other.listData);

  @override
  int get hashCode => error.hashCode ^ data.hashCode ^ listData.hashCode;

  @override
  String toString() {
    return 'ApiResponse{'  ' error: $error,'  ' data: $data,'  ' listData: $listData,'  '}';
  }

  ApiResponse copyWith({
    dynamic? error,
    dynamic? data,
    List<dynamic>? listData,
  }) {
    return ApiResponse(
      error: error ?? this.error,
      data: data ?? this.data,
      listData: listData ?? this.listData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'data': data,
      'listData': listData,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      error: map['error'] as dynamic,
      data: map['data'] as dynamic,
      listData: map['listData'] as List<dynamic>,
    );
  }

//</editor-fold>
}