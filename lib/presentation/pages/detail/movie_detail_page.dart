import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/presentation/pages/detail/movie_detail_view_model.dart';

class MovieDetailPage extends ConsumerWidget {
  final int movieId;

  const MovieDetailPage({required this.movieId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 구독
    final state = ref.watch(movieDetailViewModelProvider);
    // 데이터 로드
    if (state.status == MovieDetailStatus.initial) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(movieDetailViewModelProvider.notifier)
            .fetchMovieDetail(movieId);
      });
    }

    return Scaffold(body: Builder(builder: (context) {
      switch (state.status) {
        case MovieDetailStatus.initial:
          return const Center(child: CircularProgressIndicator());
        case MovieDetailStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case MovieDetailStatus.error:
          return Center(child: Text('Error🌱 ${state.errorMessage}'));
        case MovieDetailStatus.loaded:
          final movie = state.movieDetail;
          if (movie == null) {
            return const Center(child: Text('영화 정보가 없어요. Error🌱'));
          }
          return SingleChildScrollView(
              child: Column(
            children: [
              Text(movie.overview),
              Text(movie.title),
            ],
          ));
      }
    }));
  }
}
