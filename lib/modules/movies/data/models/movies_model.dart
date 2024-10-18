import '../../domain/entities/movies.dart';

class MoviesModel extends Movies {
  MoviesModel({
    required super.id,
    required super.title,
    required super.image,
    required super.synopsis,
    required super.rate,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      synopsis: json['synopsis'],
      rate: json['rate'].toDouble(),
      releaseDate: json['releaseDate'],
    );
  }
}
