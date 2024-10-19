import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iplay_flutter/modules/movies/presentation/atomic/templates/movies_list_template.dart';

void main() {
  testWidgets('displays CircularProgressIndicator when loading', (WidgetTester tester) async {
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: MoviesListTemplate(
          movies: const [],
          isLoading: true,
          openDetailsPage: (movieId) {},
          isFavorite: (movieId) => false,
          onFavoriteTap: (movieId) {},
        ),
      ),
    );

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays error message when the status is error', (WidgetTester tester) async {
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: MoviesListTemplate(
          movies: const [],
          isLoading: false,
          error: true,
          openDetailsPage: (movieId) {},
          isFavorite: (movieId) => false,
          onFavoriteTap: (movieId) {},
        ),
      ),
    );

    // Assert

    expect(find.text('Não foi possível carregar a lista de filmes'), findsOneWidget);
  });
}
