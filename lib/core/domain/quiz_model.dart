class QuizModel {
  final String question;
  final String image;

  ///Depending on the amount answers the position can range between 0 - X
  ///If the correctAnswerPosition is negative, then there is no correct position available
  final bool isCorrect;

//<editor-fold desc="Data Methods">

  QuizModel({
    required this.question,
    required this.image,
    required this.isCorrect,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizModel &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          image == other.image &&
          isCorrect == other.isCorrect);

  @override
  int get hashCode => question.hashCode ^ image.hashCode ^ isCorrect.hashCode;

  @override
  String toString() {
    return 'QuizModel{'  ' question: $question,'  ' image: $image,'  ' isCorrect: $isCorrect,'  '}';
  }

  QuizModel copyWith({
    String? question,
    String? image,
    bool? isCorrect,
  }) {
    return QuizModel(
      question: question ?? this.question,
      image: image ?? this.image,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'image': image,
      'isCorrect': isCorrect,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] as String,
      image: map['image'] as String,
      isCorrect: map['isCorrect'] as bool,
    );
  }

//</editor-fold>
}