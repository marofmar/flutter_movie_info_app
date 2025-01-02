import 'package:movie_info_app/domain/entity/movie_detail_entity.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class GetMovieDetail {
  final MovieRepository _movieRepository;

  GetMovieDetail(this._movieRepository);

  Future<MovieDetailEntity> call(int movieId) async {
    return await _movieRepository.getMovieDetail(movieId);
  }
}
