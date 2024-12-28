import 'package:movie_info_app/data/dto/movie_dto.dart';

abstract interface class MovieDataSource {
  // only definition
  Future<List<MovieDto>> fetchMovies();
}
