import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie_entity.dart';
import 'package:movie_info_app/domain/usecase/get_playing_now.dart';
import 'package:movie_info_app/domain/usecase/get_popular.dart';
import 'package:movie_info_app/domain/usecase/get_top_rated.dart';
import 'package:movie_info_app/domain/usecase/get_upcoming.dart';
import 'package:movie_info_app/presentation/providers.dart';

enum MovieListStatus {
  initial,
  loading,
  loaded,
  error,
}

/// ViewModel 에서 관리할 상태 (State)
class MovieListState {
  final List<MovieEntity> playingNowMovies;
  final List<MovieEntity> popularMovies;
  final List<MovieEntity> topRatedMovies;
  final List<MovieEntity> upcomingMovies;
  final MovieListStatus status;
  final String errorMessage;

  const MovieListState({
    this.playingNowMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upcomingMovies = const [],
    this.status = MovieListStatus.initial,
    this.errorMessage = '',
  });

  MovieListState copyWith({
    List<MovieEntity>? playingNowMovies,
    List<MovieEntity>? popularMovies,
    List<MovieEntity>? topRatedMovies,
    List<MovieEntity>? upcomingMovies,
    MovieListStatus? status,
    String? errorMessage,
  }) {
    return MovieListState(
      playingNowMovies: playingNowMovies ?? this.playingNowMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// ViewModel - Notifier
class MovieListNotifier extends StateNotifier<MovieListState> {
  final GetPlayingNow _getPlayingNow;
  final GetPopular _getPopular;
  final GetTopRated _getTopRated;
  final GetUpcoming _getUpcoming;

  MovieListNotifier(this._getPlayingNow, this._getPopular, this._getTopRated,
      this._getUpcoming)
      : super(const MovieListState());

  Future<void> fetchPlayingNow() async {
    state = state.copyWith(status: MovieListStatus.loading); // 로딩 상태
    try {
      final result = await _getPlayingNow();
      state = state.copyWith(
          status: MovieListStatus.loaded, playingNowMovies: result);
    } catch (e) {
      state = state.copyWith(
        status: MovieListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> fetchPopular() async {
    state = state.copyWith(status: MovieListStatus.loading); // 로딩 상태
    try {
      final result = await _getPopular();
      state =
          state.copyWith(status: MovieListStatus.loaded, popularMovies: result);
    } catch (e) {
      state = state.copyWith(
        status: MovieListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> fetchTopRated() async {
    state = state.copyWith(status: MovieListStatus.loading); // 로딩 상태
    try {
      final result = await _getTopRated();
      state = state.copyWith(
          status: MovieListStatus.loaded, topRatedMovies: result);
    } catch (e) {
      state = state.copyWith(
        status: MovieListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> fetchUpcoming() async {
    state = state.copyWith(status: MovieListStatus.loading); // 로딩 상태
    try {
      final result = await _getUpcoming();
      state = state.copyWith(
          status: MovieListStatus.loaded, upcomingMovies: result);
    } catch (e) {
      state = state.copyWith(
        status: MovieListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
//TODO: 코드에 중복이 많구나 애미야..리팩토링하거라,, Future<void> _fetchMovies()

final movieListViewModelProvider =
    StateNotifierProvider<MovieListNotifier, MovieListState>((ref) {
  return MovieListNotifier(
      ref.read(getPlayingNowUsecaseProvider),
      ref.read(getPopularUsecaseProvider),
      ref.read(getTopRatedUsecaseProvider),
      ref.read(getUpcomingUsecaseProvider));
});
