// 1 상태클래스
// 영화 리스트 <List<Movie>>

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/usecase/fetch_movies_usecase.dart';
import 'package:movie_info_app/presentation/providers.dart';

// 뷰모델
class MovieListViewModel extends Notifier<List<Movie>> {
  @override
  List<Movie> build() {
    fetchMovies();
    return [];
  }

  Future<void> fetchMovies() async {
    final fetchMoviesUseCase = ref.read(fetchMoviesUsecaseProvider);
    final result = await fetchMoviesUseCase.execute();
    state = result;
  }
}

// 뷰모델 관리해 줄 관리자, 공급자
final movieListViewModelProvider =
    NotifierProvider<MovieListViewModel, List<Movie>>(() {
  return MovieListViewModel();
});
