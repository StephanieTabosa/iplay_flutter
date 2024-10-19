import 'package:dio/dio.dart';
import 'package:iplay_flutter/modules/movies/data/datasources/movies_datasource.dart';
import 'package:iplay_flutter/modules/movies/data/hive/favorites_movies_box_handler.dart';
import 'package:iplay_flutter/modules/movies/domain/entities/movies.dart';
import 'package:iplay_flutter/modules/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:iplay_flutter/modules/movies/movies_navigator.dart';
import 'package:iplay_flutter/modules/shared/data/app_network_impl.dart';
import 'package:iplay_flutter/modules/shared/data/failures.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class MoviesDatasourceMock extends Mock implements MoviesDatasource {}

class MoviesNavigatorMock extends Mock implements MoviesNavigator {}

class GetMoviesListUsecaseMock extends Mock implements GetMoviesListUsecase {}

class FavoritesMoviesBoxHandlerMock extends Mock implements FavoritesMoviesBoxHandler {
  @override
  Future<void> openBox(String boxName) {
    return Future.value();
  }
}

const appNetworkImplMock = AppNetworkImpl();

List<Movies> moviesListMock = [
  const Movies(
    id: 1,
    title: 'Title 1',
    image:
        'https://github.com/alura-cursos/movie-api/blob/main/images/vingadores-ultimato.jpg?raw=true',
    rate: 9.2,
    releaseDate: '20/10/2000',
    synopsis: '',
  ),
  const Movies(
    id: 2,
    title: 'Title 2',
    image: 'https://github.com/alura-cursos/movie-api/blob/main/images/avatar-2.jpg?raw=true',
    rate: 7.8,
    releaseDate: '15/02/1998',
    synopsis: '',
  ),
];

const movieMock = Movies(
  id: 2,
  title: 'Title 2',
  image: 'https://github.com/alura-cursos/movie-api/blob/main/images/avatar-2.jpg?raw=true',
  rate: 7.8,
  releaseDate: '15/02/1998',
  synopsis: '',
);

final exceptionMock = Exception('Error');

final failureMock = Failure(exception: exceptionMock);

class MockPathProvider {
  static Future<String> getApplicationDocumentsDirectory() async {
    return '/mock/path';
  }
}

class DioExceptionMock extends DioException {
  DioExceptionMock({
    int statusCode = 400,
    dynamic data,
  }) : super(
          requestOptions: emptyRequestOptions,
          response: Response(
            requestOptions: emptyRequestOptions,
            statusCode: statusCode,
            data: data,
          ),
        );
}

final emptyRequestOptions = RequestOptions(path: '');

class ResponseMock<T> extends Response<T> {
  ResponseMock({
    RequestOptions? requestOptions,
    super.data,
    super.headers,
    super.isRedirect,
    super.statusCode,
    super.statusMessage,
    super.redirects,
    super.extra,
  }) : super(requestOptions: requestOptions ?? emptyRequestOptions);
}
