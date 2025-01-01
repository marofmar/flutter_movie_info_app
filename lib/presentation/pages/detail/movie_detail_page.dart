import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/presentation/pages/detail/movie_detail_view_model.dart';
import 'package:movie_info_app/presentation/providers.dart';

class MovieDetailPage extends ConsumerWidget {
  final int movieId;

  const MovieDetailPage({required this.movieId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 구독
    final state = ref.watch(movieDetailViewModelProvider);
    // 데이터 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(movieDetailViewModelProvider.notifier).fetchMovieDetail(movieId);
    });

    return Scaffold(
      body: state.when(
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
          error: (error, stack) => Center(
                child: Text('Error🍂: $error'),
              ),
          data: (movie) {
            return SingleChildScrollView(
                child: Column(
              children: [
                Text(movie.title),
                Text(movie.overview),
                Text(movie.tagline),
              ],
            ));
          }),
    );
  }
}
