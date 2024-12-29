import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/usecase/fetch_movies_usecase.dart';
import 'package:movie_info_app/presentation/pages/home/movie_list_view_model.dart';
import 'package:movie_info_app/presentation/providers.dart';

class MockFetchMoviesUsecase extends Mock implements FetchMoviesUsecase {}

void main() {
  ProviderContainer? providerContainer;

  setUp(
    () {
      final fetchMoviesUsecaseProviderOverride =
          fetchMoviesUsecaseProvider.overrideWith(
        (ref) {
          return MockFetchMoviesUsecase();
        },
      );
      providerContainer = ProviderContainer(overrides: [
        fetchMoviesUsecaseProviderOverride,
      ]);
      addTearDown(providerContainer!.dispose);
    },
  );

  test('MovieListViewModel test: state update after fetchMovies', () async {
    when(() => providerContainer!.read(fetchMoviesUsecaseProvider).execute())
        .thenAnswer((_) async => [
              Movie(
                  title: 'title',
                  released: 'released',
                  runtime: 'runtime',
                  director: 'director',
                  actors: 'actors',
                  poster: 'poster'),
            ]);
    final stateBefore = providerContainer!.read(movieListViewModelProvider);

    await providerContainer!
        .read(movieListViewModelProvider.notifier)
        .fetchMovies();

    final stateAfter = providerContainer!.read(movieListViewModelProvider);
    expect(stateAfter.isEmpty, false);
  });
}
