import 'package:flutter_modular/flutter_modular.dart';

import 'domain/entities/movies.dart';
import 'presentation/pages/movies_details_page.dart';
import 'presentation/pages/movies_list_page.dart';

class MoviesNavigator {
  const MoviesNavigator();

  void openMoviesList() {
    Modular.to.pushNamed(MoviesListPage.routePath);
  }

  void openMoviesDetails({
    required Movies movie,
  }) {
    Modular.to.pushNamed(
      MoviesDetailsPage.routePath,
      arguments: movie,
    );
  }
}
