import 'package:dio/dio.dart';

import '../../../shared/data/exceptions.dart';
import '../../domain/entities/movies.dart';
import '../models/movies_model.dart';
import 'movies_datasource.dart';

class MoviesDatasourceImpl implements MoviesDatasource {
  const MoviesDatasourceImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;
  final String _moviesUrl = 'https://my-json-server.typicode.com/alura-cursos/movie-api/movies';

  @override
  Future<List<Movies>> getMoviesList() async {
    try {
      final response = await _dio.get(_moviesUrl);

      final moviesList = (response.data as List).map((json) {
        return MoviesModel.fromJson(json);
      }).toList();

      return moviesList;
    } catch (error) {
      throw ParseDataException('$MoviesDatasourceImpl parse error: $error');
    }
  }
}
