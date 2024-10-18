class MoviesStrings {
  static const home = _HomeStrings();
  static const movies = _MoviesListStrings();
  static const details = _MovieDetailsStrings();
}

class _HomeStrings {
  const _HomeStrings();

  String get descriptionMovies => 'Filmes &\nDiversão &\nEntretenimento';
  String get discoverNewMovies => 'Descubra novos filmes e divirta-se!';
  String get buttonText => 'Começar';
}

class _MoviesListStrings {
  const _MoviesListStrings();

  String get title => 'Lista de filmes';
  String release(String date) => 'Lançamento: $date';
  String get errorMessage => 'Não foi possível carregar a lista de filmes';
}

class _MovieDetailsStrings {
  const _MovieDetailsStrings();

  String rate(double rate) => 'Classificação: $rate';
}
