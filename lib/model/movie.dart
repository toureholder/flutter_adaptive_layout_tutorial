import '../data/data.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  static List<Movie> getList() => data
      .map(
        (element) => Movie(
          id: element['id'],
          title: element['title'],
          overview: element['overview'],
          posterPath: element['poster_path'],
        ),
      )
      .toList();
}

const String LARGE_POSTER_BASE_URL = "https://image.tmdb.org/t/p/w300";
const String SMALL_POSTER_BASE_URL = "https://image.tmdb.org/t/p/w92";
