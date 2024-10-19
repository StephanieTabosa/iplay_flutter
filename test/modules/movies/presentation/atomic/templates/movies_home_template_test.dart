import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iplay_flutter/modules/movies/movies_strings.dart';
import 'package:iplay_flutter/modules/movies/presentation/atomic/templates/movies_home_template.dart';

void main() {
  testWidgets('displays logo, description, and continue button', (WidgetTester tester) async {
    // Arrange
    const buttonText = 'Começar';
    await tester.pumpWidget(
      MaterialApp(
        home: MoviesHomeTemplate(
          onContinueButtonTap: () {},
        ),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(Image), findsOneWidget);
    expect(find.text(MoviesStrings.home.descriptionMovies), findsOneWidget);
    expect(find.text(MoviesStrings.home.discoverNewMovies), findsOneWidget);
    expect(find.text(buttonText), findsOneWidget);
  });
}
