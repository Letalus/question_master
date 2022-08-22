class QuizModel {
  String question;
  String image;
  bool isFirstAnswerTrue;

//<editor-fold desc="Data Methods">

  QuizModel({
    required this.question,
    required this.image,
    required this.isFirstAnswerTrue,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizModel &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          image == other.image &&
          isFirstAnswerTrue == other.isFirstAnswerTrue);

  @override
  int get hashCode => question.hashCode ^ image.hashCode ^ isFirstAnswerTrue.hashCode;

  @override
  String toString() {
    return 'QuizModel{'  ' question: $question,'  ' image: $image,'  ' isFirstAnswerTrue: $isFirstAnswerTrue,'  '}';
  }

  QuizModel copyWith({
    String? question,
    String? image,
    bool? isFirstAnswerTrue,
  }) {
    return QuizModel(
      question: question ?? this.question,
      image: image ?? this.image,
      isFirstAnswerTrue: isFirstAnswerTrue ?? this.isFirstAnswerTrue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'image': image,
      'isFirstAnswerTrue': isFirstAnswerTrue,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] as String,
      image: map['image'] as String,
      isFirstAnswerTrue: map['isFirstAnswerTrue'] as bool,
    );
  }

//</editor-fold>
}