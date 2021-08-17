import '../../../domain/entities/number_trivia.dart';
import '../number_trivia_bloc.dart';

class LoadedNumberTriviaState extends NumberTriviaState {
  final NumberTrivia trivia;

  LoadedNumberTriviaState({
    required this.trivia,
  });

  @override
  List<Object> get props => [this.trivia];
}
