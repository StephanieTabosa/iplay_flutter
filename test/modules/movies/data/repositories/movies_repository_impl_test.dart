import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iplay_flutter/modules/movies/data/datasources/movies_datasource.dart';
import 'package:iplay_flutter/modules/movies/data/repositories/movies_repository_impl.dart';
import 'package:iplay_flutter/modules/movies/domain/repositories/movies_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late MoviesRepository repository;
  late MoviesDatasource moviesDatasource;

  setUp(() {
    moviesDatasource = MoviesDatasourceMock();

    repository = MoviesRepositoryImpl(
      moviesDatasource: moviesDatasource,
    );
  });
  group('When [getMoviesList] is called', () {
    test('and [datasource] succeeds, should return a [Right] with a [List<Movies>].', () async {
      // Arrange
      when(moviesDatasource.getMoviesList).thenAnswer((_) async => moviesListMock);

      // Act
      final result = await repository.getMoviesList();

      // Assert
      expect(result, Right(moviesListMock));
    });

    test('and [datasource] fails, should return a [Left] with a [Failure].', () async {
      // Arrange
      when(moviesDatasource.getMoviesList).thenThrow(exceptionMock);

      // Act
      final result = await repository.getMoviesList();

      // Assert
      expect(result, Left(failureMock));
    });
  });
}
