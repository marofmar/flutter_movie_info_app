import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_info_app/data/core/api_constants.dart';
import 'package:movie_info_app/domain/entity/movie_entity.dart';
import 'package:movie_info_app/presentation/pages/home/movie_list_view_model.dart';
import 'package:movie_info_app/presentation/widgets/theme_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieListViewModelProvider); // ViewModel State 구독
    final themeMode = ref.watch(themeNotifierProvider); // 현재 테마 구독
    final themeNotifier = ref.read(themeNotifierProvider.notifier); // 변경

    switch (state.status) {
      // 데이터 로드
      case MovieListStatus.initial:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final notifier = ref.read(movieListViewModelProvider.notifier);
          notifier.fetchPlayingNow();
          notifier.fetchPopular();
          notifier.fetchTopRated();
          notifier.fetchUpcoming();
        });
        return const Center(child: Text('Loading...'));

      // 로딩 중
      case MovieListStatus.loading:
        return const Center(child: CircularProgressIndicator());

      // 에러 발생
      case MovieListStatus.error:
        return Scaffold(
          body: Center(child: Text('Error🌱 ${state.errorMessage}')),
        );

      // 로드 완료
      case MovieListStatus.loaded:
        final mostPopular = state.popularMovies.first;

        return Scaffold(
          // appBar: AppBar(actions: [
          //   IconButton(
          //     icon: Icon(
          //       themeMode == ThemeMode.dark
          //           ? Icons.light_mode
          //           : Icons.dark_mode,
          //     ),
          //     onPressed: () {
          //       return themeNotifier.toggleTheme();
          //     },
          //   )
          // ]),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                const SectionTitle(title: 'Most Popular'),
                TopMoviePoster(movie: mostPopular),
                // 현재 상영 중
                const SectionTitle(title: 'Now Playing'),
                Carousel(movies: state.playingNowMovies),
                // 인기 순
                const SectionTitle(title: 'Popular'),
                Carousel(movies: state.popularMovies),
                // 평점 높은 순
                const SectionTitle(title: 'Top Rated'),
                Carousel(movies: state.topRatedMovies),
                // 개봉 예정
                const SectionTitle(title: 'Coming soon'),
                Carousel(movies: state.upcomingMovies),
              ],
            ),
          ),
        );
    }
  }
}

// 큰 포스터 위젯
class TopMoviePoster extends StatelessWidget {
  final MovieEntity movie;

  const TopMoviePoster({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: AspectRatio(
        aspectRatio: 2 / 3, // 가로 세로 비율 설정
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
          child: Image.network(
            '${ApiConstants.baseImageUrl}${movie.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// 섹션 제목 위젯
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 21),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: GoogleFonts.montserrat(
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.movies,
  });

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 20 : 5,
                right: index == movies.length - 1 ? 20 : 5),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    '${ApiConstants.baseImageUrl}${movie.posterPath}',
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
