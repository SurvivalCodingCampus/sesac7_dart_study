class Movie {
  final String? title;
  final String? director;
  final num? year;

  Movie(this.title, this.director, this.year);

  Movie.fromJson(Map<String, dynamic> json)
    : title = (json['title'] is String) ? json['title'] as String : null,
      director = (json['director'] is String)
          ? json['director'] as String
          : null,
      year = (json['year'] is num) ? json['year'] as num : null;

  Map<String, dynamic> toJson() {
    return {'title': title, 'director': director, 'year': year};
  }

  @override
  bool operator ==(Object other) {
    return (other is Movie)
        ? title == other.title && director == other.director
        : false;
  }

  @override
  int get hashCode => title.hashCode ^ director.hashCode ^ year.hashCode;

  @override
  String toString() {
    return '{"title": title, "director": director, "year": year}';
  }
}
