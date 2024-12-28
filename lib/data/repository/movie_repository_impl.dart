import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);

  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>> fetchMovies() async {
    final result =
        await _movieDataSource.fetchMovies(); // 현재 result type: MovideDto
    return result
        .map((e) => Movie(
            title: e.title,
            released: e.released,
            runtime: e.runtime,
            director: e.director,
            actors: e.actors,
            poster: e.poster))
        .toList();
  }
}
