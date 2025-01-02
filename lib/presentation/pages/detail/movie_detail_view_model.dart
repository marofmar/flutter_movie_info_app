import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie_detail_entity.dart';
import 'package:movie_info_app/domain/usecase/get_movie_detail.dart';
import 'package:movie_info_app/presentation/providers.dart';

enum MovieDetailStatus { initial, loading, loaded, error }

class MovieDetailState {
  final MovieDetailEntity? movieDetail;
  final MovieDetailStatus status;
  final String errorMessage;

  const MovieDetailState(
      {this.movieDetail,
      this.status = MovieDetailStatus.initial,
      this.errorMessage = ''});

  MovieDetailState copyWith({
    MovieDetailEntity? movieDetail,
    MovieDetailStatus? status,
    String? errorMessage,
  }) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class MovieDetailNotifier extends StateNotifier<MovieDetailState> {
  final GetMovieDetail _getMovieDetail;

  MovieDetailNotifier(this._getMovieDetail) : super(const MovieDetailState());

  Future<void> fetchMovieDetail(int movieId) async {
    state = state.copyWith(status: MovieDetailStatus.loading); // 기본 로딩 상태
    try {
      final result = await _getMovieDetail(movieId);
      state =
          state.copyWith(status: MovieDetailStatus.loaded, movieDetail: result);
    } catch (e) {
      state = state.copyWith(
          status: MovieDetailStatus.error, errorMessage: e.toString());
    }
  }
}

final movieDetailViewModelProvider =
    StateNotifierProvider.family<MovieDetailNotifier, MovieDetailState, int>(
        (ref, movieId) {
  final getMovieDetail = ref.read(getMovieDetailUsecaseProvider);
  return MovieDetailNotifier(getMovieDetail)..fetchMovieDetail(movieId);
});
