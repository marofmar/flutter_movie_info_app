import 'package:movie_info_app/domain/entity/movie_entity.dart';

abstract interface class MovieRepository {
  // Future<List<Movie>> fetchMovies();
  Future<List<MovieEntity>> getPlayingNow();
  Future<List<MovieEntity>> getTopRated();
  Future<List<MovieEntity>> getUpcoming();
  Future<List<MovieEntity>> getPopular();

  // Future<MovieDetailEntity> getMovieDetail(int movieId);
}
