class MovieModel {
  final String id;
  final String name;
  final String imageUrl;

  MovieModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
    );
  }
}
