import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class FetchMoviesUsecase {
  FetchMoviesUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>> execute() async {
    return await _movieRepository.fetchMovies();
  }
}
