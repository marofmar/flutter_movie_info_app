import 'package:movie_info_app/domain/entity/movie_entity.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class GetUpcoming {
  final MovieRepository _movieRepository;

  GetUpcoming(this._movieRepository);

  @override
  Future<List<MovieEntity>> call() async {
    return await _movieRepository.getUpcoming();
  }
}
