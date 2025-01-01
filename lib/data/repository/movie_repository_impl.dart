import 'package:movie_info_app/data/data_source/movie_remote_data_source.dart';
import 'package:movie_info_app/domain/entity/movie_entity.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRepositoryImpl(this._movieRemoteDataSource);
  @override
  Future<List<MovieEntity>> getPlayingNow() async {
    final movies = await _movieRemoteDataSource.getPlayingNow();
    return movies.map((movie) => movie.toEntity()).toList();
  }

  // @override
  // Future<MovieDetailEntity> getMovieDetail(int movieId) async {
  //   final movie = await _movieRemoteDataSource.getMovieDetail(movieId);
  //   return movie.toDetailEntity();
  // }

  @override
  Future<List<MovieEntity>> getPopular() async {
    final movies = await _movieRemoteDataSource.getPopular();
    return movies.map((movie) => movie.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> getTopRated() async {
    final movies = await _movieRemoteDataSource.getTopRated();
    return movies.map((movie) => movie.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> getUpcoming() async {
    final movies = await _movieRemoteDataSource.getUpcoming();
    return movies.map((movie) => movie.toEntity()).toList();
  }
}
