class Movies {
  const Movies({
    required this.id,
    required this.title,
    required this.image,
    required this.synopsis,
    required this.rate,
    required this.releaseDate,
  });

  final int id;
  final String title;
  final String image;
  final String synopsis;
  final double rate;
  final String releaseDate;
}
