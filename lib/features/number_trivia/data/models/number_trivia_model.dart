import 'package:clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    required int number,
    required String text,
  }) : super(number: number, text: text);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    final number = (json['number'] as num).toInt();
    final text = json['text'];
    final model = NumberTriviaModel(number: number, text: text);

    return model;
  }

  Map<String, dynamic> toJson() => {'number': this.number, 'text': this.text};
}
