class MovieDetailModel {
  final String id;
  final String name;
  final String imageUrl;
  final num score;
  final String imdbUrl;
  final String description;

  MovieDetailModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.score,
    required this.imdbUrl,
    required this.description,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      score: json['score'],
      imdbUrl: json['imdb'],
      description: json['description'],
    );
  }
}
