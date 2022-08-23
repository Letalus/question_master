class QuizModel {
  final String question;
  final String image;

  ///Depending on the amount answers the position can range between 0 - X
  ///If the correctAnswerPosition is negative, then there is no correct position available
  final int correctAnswerPosition;

//<editor-fold desc="Data Methods">

  QuizModel({
    required this.question,
    required this.image,
    required this.correctAnswerPosition,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizModel &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          image == other.image &&
          correctAnswerPosition == other.correctAnswerPosition);

  @override
  int get hashCode => question.hashCode ^ image.hashCode ^ correctAnswerPosition.hashCode;

  @override
  String toString() {
    return 'QuizModel{'  ' question: $question,'  ' image: $image,'  ' correctAnswerPosition: $correctAnswerPosition,'  '}';
  }

  QuizModel copyWith({
    String? question,
    String? image,
    int? correctAnswerPosition,
  }) {
    return QuizModel(
      question: question ?? this.question,
      image: image ?? this.image,
      correctAnswerPosition: correctAnswerPosition ?? this.correctAnswerPosition,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'image': image,
      'correctAnswerPosition': correctAnswerPosition,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] as String,
      image: map['image'] as String,
      correctAnswerPosition: map['correctAnswerPosition'] as int,
    );
  }

//</editor-fold>
}