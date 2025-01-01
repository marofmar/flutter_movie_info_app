import 'package:movie_info_app/domain/entity/movie_entity.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class GetTopRated {
  final MovieRepository _movieRepository;

  GetTopRated(this._movieRepository);

  Future<List<MovieEntity>> call() async {
    return await _movieRepository.getTopRated();
  }
}
