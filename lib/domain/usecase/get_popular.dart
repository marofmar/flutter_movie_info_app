import 'package:movie_info_app/domain/entity/movie_entity.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class GetPopular {
  final MovieRepository _movieRepository;

  GetPopular(this._movieRepository);

  Future<List<MovieEntity>> call() async {
    return await _movieRepository.getPopular();
  }
}
