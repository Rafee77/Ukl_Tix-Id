class MovieModel {
  int id;
  String title;
  String sutradara;

  String posterpath;
  MovieModel(
      {required this.id,
      required this.title,
      required this.sutradara,
      required this.posterpath});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.title == title &&
        other.sutradara == sutradara &&
        other.posterpath == posterpath;
  }

  @override
  int get hashCode {
    return title.hashCode ^ sutradara.hashCode ^ posterpath.hashCode;
  }
}
