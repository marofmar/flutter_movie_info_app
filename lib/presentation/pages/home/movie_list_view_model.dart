import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie_entity.dart';
import 'package:movie_info_app/domain/usecase/get_playing_now.dart';
import 'package:movie_info_app/presentation/providers.dart';

enum MovieListStatus {
  initial,
  loading,
  loaded,
  error,
}

/// ViewModel 에서 관리할 상태 (State)
class MovieListState {
  final List<MovieEntity> movies;
  final MovieListStatus status;
  final String errorMessage;

  const MovieListState({
    this.movies = const [],
    this.status = MovieListStatus.initial,
    this.errorMessage = '',
  });

  MovieListState copyWith({
    List<MovieEntity>? movies,
    MovieListStatus? status,
    String? errorMessage,
  }) {
    return MovieListState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// ViewModel - Notifier
class MovieListNotifier extends StateNotifier<MovieListState> {
  final GetPlayingNow _getPlayingNow;
  MovieListNotifier(this._getPlayingNow) : super(const MovieListState());

  Future<void> fetchPlayingNow() async {
    state = state.copyWith(status: MovieListStatus.loading); // 로딩 상태
    try {
      final result = await _getPlayingNow();
      state = state.copyWith(status: MovieListStatus.loaded, movies: result);
    } catch (e) {
      state = state.copyWith(
        status: MovieListStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}

final getPlayingNowUsecaseProvider = Provider<GetPlayingNow>((ref) {
  return GetPlayingNow(ref.read(movieRepositoryProvider));
});

final movieListViewModelProvider =
    StateNotifierProvider<MovieListNotifier, MovieListState>((ref) {
  return MovieListNotifier(ref.read(getPlayingNowUsecaseProvider));
});
