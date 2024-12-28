import 'package:movie_info_app/domain/entity/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> fetchMovies();
}
