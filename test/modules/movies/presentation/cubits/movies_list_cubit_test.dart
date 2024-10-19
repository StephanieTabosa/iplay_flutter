import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  late FavoritesMoviesBoxHandlerMock favoritesMoviesBoxHandlerMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final directory = await MockPathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory);
  });

  setUp(() {
    registerFallbackValue(movieMock);
    moviesNavigator = MoviesNavigatorMock();
    getMoviesListUsecase = GetMoviesListUsecaseMock();
    favoritesMoviesBoxHandlerMock = FavoritesMoviesBoxHandlerMock();

    when(() => getMoviesListUsecase.getMoviesList()).thenAnswer((_) async => Right(moviesListMock));

    cubit = MoviesListCubit(
      moviesNavigator: moviesNavigator,
      getMoviesListUsecase: getMoviesListUsecase,
      favoritesMoviesBoxHandler: favoritesMoviesBoxHandlerMock,
    );
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await Hive.close();
  });

  group('When [onFavoriteTap] is called,', () {
    test('should add a movie to favorites if it is not already a favorite', () async {
      // Arrange
      when(() => favoritesMoviesBoxHandlerMock.isFavorite(movieMock.id)).thenReturn(false);
      when(() => favoritesMoviesBoxHandlerMock.addFavorite(movieMock.id)).thenAnswer((_) async {});

      // Act
      cubit.onFavoriteTap(movieMock.id);

      // Assert
      verify(() => favoritesMoviesBoxHandlerMock.addFavorite(movieMock.id)).called(1);
    });

    test('should remove a movie from favorites if it is already a favorite', () async {
      // Arrange
      when(() => favoritesMoviesBoxHandlerMock.isFavorite(movieMock.id)).thenReturn(true);
      when(() => favoritesMoviesBoxHandlerMock.removeFavorite(movieMock.id))
          .thenAnswer((_) async {});

      // Act
      cubit.onFavoriteTap(movieMock.id);

      // Assert
      verify(() => favoritesMoviesBoxHandlerMock.removeFavorite(movieMock.id)).called(1);
    });
  });

  group('When [isFavorite] is called,', () {
    test('should return true if the movie is a favorite', () {
      // Arrange
      when(() => favoritesMoviesBoxHandlerMock.isFavorite(movieMock.id)).thenReturn(true);

      // Act
      final result = cubit.isFavorite(movieMock.id);

      // Assert
      expect(result, true);
    });

    test('should return false if the movie is not a favorite', () {
      // Arrange
      when(() => favoritesMoviesBoxHandlerMock.isFavorite(movieMock.id)).thenReturn(false);

      // Act
      final result = cubit.isFavorite(movieMock.id);

      // Assert
      expect(result, false);
    });
  });

  group('When [onInit] is called,', () {
    test('should emit loading state and then success state', () async {
      // Act
      await cubit.onInit();

      // Assert
      expect(cubit.state.moviesListStatus, Status.success);
    });

    test('and when request fails, should emit failure state', () async {
      // Arrange
      when(() => getMoviesListUsecase.getMoviesList()).thenAnswer((_) async => Left(failureMock));

      // Act
      await cubit.onInit();

      // Assert
      expect(cubit.state.moviesListStatus, Status.failure);
    });
  });

  test('When [openDetailsPage] is called, should call [moviesNavigator.openMoviesDetails]', () {
    final movieItem = moviesListMock.first;

    // Act
    cubit.openDetailsPage(movieItem);

    // Assert
    verify(
      () => moviesNavigator.openMoviesDetails(movie: any(named: 'movie')),
    ).called(1);
  });
}
