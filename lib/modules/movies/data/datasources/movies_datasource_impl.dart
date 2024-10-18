import 'package:dio/dio.dart';

import '../../../shared/data/app_network_impl.dart';
import '../../../shared/data/exceptions.dart';
import '../../domain/entities/movies.dart';
import '../models/movies_model.dart';
import 'movies_datasource.dart';

class MoviesDatasourceImpl implements MoviesDatasource {
  const MoviesDatasourceImpl({
    required this.dio,
    required this.network,
  });

  final Dio dio;
  final AppNetworkImpl network;

  @override
  Future<List<Movies>> getMoviesList() async {
    try {
      final response = await dio.get(network.fetchMovies);

      final moviesList = (response.data as List).map((json) {
        return MoviesModel.fromJson(json);
      }).toList();

      return moviesList;
    } catch (error) {
      throw ParseDataException('$MoviesDatasourceImpl parse error: $error');
    }
  }
}
