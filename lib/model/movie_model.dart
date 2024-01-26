class Movie {
  final String title;
  final String backDropPath;
  final String overview;
  final String posterPath;

  Movie({required this.title, required this.backDropPath, required this.overview, required this.posterPath});

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      overview: map['overview'],
      posterPath: map['poster_path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'backDropPath': backDropPath, 'overview': overview, 'posterPath': posterPath};
  }
}
