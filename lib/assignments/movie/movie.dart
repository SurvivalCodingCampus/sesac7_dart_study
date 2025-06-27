class Movie {
  static const String titleKey = 'title';
  static const String directorKey = 'director';
  static const String yearKey = 'year';
  static const String unknown = 'unknown';
  static const int nullYear = 0;

  final String title;
  final String director;
  final num year;

  Movie({
    required this.title,
    required this.director,
    required this.year,
  });

  Movie.fromJson(Map<String, dynamic> json)
    : title = json[titleKey] ?? unknown,
      director = json[directorKey] ?? unknown,
      year = json[yearKey] ?? nullYear;

  Map<String, dynamic> toJson() {
    return {
      titleKey: title,
      directorKey: director,
      yearKey: year,
    };
  }

  @override
  int get hashCode => Object.hash(title, director, year);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Movie &&
            title == other.title &&
            director == other.director &&
            year == other.year;
  }
}
