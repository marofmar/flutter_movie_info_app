import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app/data/core/api_constants.dart';
import 'package:movie_info_app/presentation/pages/home/movie_list_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieListViewModelProvider); // ViewModel State 구독
    switch (state.status) {
      case MovieListStatus.initial:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(movieListViewModelProvider.notifier).fetchPlayingNow();
        });
        return const Center(child: Text('로딩 준비 중...'));

      case MovieListStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case MovieListStatus.error:
        return Scaffold(
          appBar: AppBar(title: Text('영화 목록')),
          body: Center(child: Text('문제가 발생했습니다🌱 ${state.errorMessage}')),
        );

      case MovieListStatus.loaded:
        final movies = state.playingNowMovies;
        return Scaffold(
            appBar: AppBar(title: Text('영화 목록')),
            body: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];

                return Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Image.network(
                          '${ApiConstants.baseImageUrl}${movie.posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(movie.title),
                          // Text(movie.released),
                          // Text(movie.runtime),
                          // Text(movie.director),
                          // Text(movie.actors),
                        ],
                      )),
                    ],
                  ),
                );
              },
            ));
    }
  }
}
