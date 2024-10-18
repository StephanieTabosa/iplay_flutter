import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iplay_flutter/modules/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:iplay_flutter/modules/movies/movies_navigator.dart';
import 'package:iplay_flutter/modules/movies/presentation/cubits/movies_list_cubit.dart';
import 'package:iplay_flutter/modules/shared/utils/status.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late MoviesListCubit cubit;
  late MoviesNavigator moviesNavigator;
  late GetMoviesListUsecase getMoviesListUsecase;

  setUp(() {
    registerFallbackValue(movieMock);
    moviesNavigator = MoviesNavigatorMock();
    getMoviesListUsecase = GetMoviesListUsecaseMock();

    cubit = MoviesListCubit(
      moviesNavigator: moviesNavigator,
      getMoviesListUsecase: getMoviesListUsecase,
    );
  });

  group('When [onInit] is called,', () {
    //Arrange
    getMoviesListUsecaseCallbackMock() => getMoviesListUsecase.getMoviesList();

    setUp(() {
      //Arrange
      when(() => getMoviesListUsecaseCallbackMock()).thenAnswer((_) async => Right(moviesListMock));
    });

    group('should call [getMoviesListUsecase]', () {
      test('should emit state [Status.loading]', () {
        // Act
        cubit.onInit();

        // Assert
        expect(cubit.state.moviesListStatus, Status.loading);
      });
      test('and when request is a success, should emit state [Status.success]', () async {
        // Act
        await cubit.onInit();

        // Assert
        expect(cubit.state.moviesListStatus, Status.success);
      });
      test('and when request is a unsuccess, should emit state [Status.failure]', () async {
        //Arrange
        when(() => getMoviesListUsecaseCallbackMock()).thenAnswer((_) async => Left(failureMock));

        // Act
        await cubit.onInit();

        // Assert
        expect(cubit.state.moviesListStatus, Status.failure);
      });
    });
  });

  test('When [openDetailsPage] is called, should call [moviesNavigator.openMoviesDetails]', () {
    final movieItem = moviesListMock.first;

    // Act
    cubit.openDetailsPage(movieItem);

    // Assert
    verify(
      () => moviesNavigator.openMoviesDetails(
        movie: any(named: 'movie'),
      ),
    ).called(1);
  });
}
