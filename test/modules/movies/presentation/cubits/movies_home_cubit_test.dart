import 'package:flutter_test/flutter_test.dart';
import 'package:iplay_flutter/modules/movies/movies_navigator.dart';
import 'package:iplay_flutter/modules/movies/presentation/cubits/movies_home_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late MoviesHomeCubit cubit;
  late MoviesNavigator moviesNavigator;

  setUp(() {
    moviesNavigator = MoviesNavigatorMock();

    cubit = MoviesHomeCubit(
      moviesNavigator: moviesNavigator,
    );
  });

  test('When [onContinueButtonTap] is called, should call [moviesNavigator.openMoviesList]', () {
    // Act
    cubit.onContinueButtonTap();

    // Assert
    verify(
      () => moviesNavigator.openMoviesList(),
    ).called(1);
  });
}
