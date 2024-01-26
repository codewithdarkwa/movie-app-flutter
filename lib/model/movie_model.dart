class Movie {
  final String title;
  final String originalTitle;
  final String backDropPath;
  final String overview;
  final String posterPath;

  Movie({
    required this.title,
    required this.originalTitle,
    required this.backDropPath,
    required this.overview,
    required this.posterPath,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      originalTitle: map['original_title'],
      backDropPath: map['backdrop_path'],
      overview: map['overview'],
      posterPath: map['poster_path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'originalTitle': originalTitle,
      'backDropPath': backDropPath,
      'overview': overview,
      'posterPath': posterPath,
    };
  }
}
