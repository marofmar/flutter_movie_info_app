import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie_detail_entity.dart';
import 'package:movie_info_app/domain/usecase/get_movie_detail.dart';

class MovieDetailNotifier extends StateNotifier<AsyncValue<MovieDetailEntity>> {
  final GetMovieDetail _getMovieDetail;

  MovieDetailNotifier(this._getMovieDetail) : super(const AsyncValue.loading());

  Future<void> fetchMovieDetail(int movieId) async {
    try {
      state = const AsyncValue.loading();
      final movie = await _getMovieDetail(movieId);
      state = AsyncValue.data(movie);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
