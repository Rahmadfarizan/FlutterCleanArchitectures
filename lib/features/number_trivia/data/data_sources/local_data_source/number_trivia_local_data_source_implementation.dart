import 'dart:convert';

import 'package:clean_architecture/core/error/exceptions/cache_exception.dart';
import 'package:clean_architecture/features/number_trivia/data/data_sources/local_data_source/number_trivia_local_data_source.dart';
import 'package:clean_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSourceImplementation
    implements NumberTriviaLocalDataSource {
  final SharedPreferences _sharedPreferences;

  NumberTriviaLocalDataSourceImplementation({
    required SharedPreferences sharedPreferences,
  }) : this._sharedPreferences = sharedPreferences;

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final numberTriviaString =
        this._sharedPreferences.getString(CACHED_NUMBER_TRIVIA);

    if (numberTriviaString == null) {
      throw CacheException();
    } else {
      final numberTriviaJson = json.decode(numberTriviaString);
      final numberTriviaModel = NumberTriviaModel.fromJson(numberTriviaJson);
      final numberTriviaFuture = Future.value(numberTriviaModel);

      return numberTriviaFuture;
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) async {
    final triviaMap = triviaToCache.toJson();
    final triviaJson = json.encode(triviaMap);

    this._sharedPreferences.setString(CACHED_NUMBER_TRIVIA, triviaJson);
  }
}
