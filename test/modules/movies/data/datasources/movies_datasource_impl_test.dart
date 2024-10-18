import 'package:flutter_test/flutter_test.dart';
import 'package:iplay_flutter/mocks/maps/get_movies_list_result.dart';
import 'package:iplay_flutter/modules/movies/data/datasources/movies_datasource.dart';
import 'package:iplay_flutter/modules/movies/data/datasources/movies_datasource_impl.dart';
import 'package:iplay_flutter/modules/movies/domain/entities/movies.dart';
import 'package:iplay_flutter/modules/shared/data/exceptions.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late MoviesDatasource datasource;
  late DioMock dio;

  setUp(() {
    dio = DioMock();
    datasource = MoviesDatasourceImpl(dio: dio);
  });

  group('When [getMoviesList] is called', () {
    dioCallbackMock() => dio.get(any());
    test('and succeeds, an [<List<Movies>>] should be returned.', () async {
      // Arrange
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock(data: getMoviesListResult));

      // Act
      final result = await datasource.getMoviesList();

      // Assert
      expect(result, isA<List<Movies>>());
      verify(dioCallbackMock).called(1);
    });

    test('and parse fails, a [ParseDataException] should be thrown.', () async {
      // Arrange
      when(dioCallbackMock).thenAnswer((_) async => ResponseMock());

      // Act
      final callback = datasource.getMoviesList();

      // Assert
      expect(callback, throwsA(isA<ParseDataException>()));
      verify(dioCallbackMock).called(1);
    });
  });
}
