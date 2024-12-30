import 'package:movie_info_app/domain/entity/movie_entity.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class GetPlayingNow {
  final MovieRepository _movieRepository;

  GetPlayingNow(this._movieRepository);

  @override
  Future<List<MovieEntity>> call() async {
    return await _movieRepository.getPlayingNow();
  }
}
