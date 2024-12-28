import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/domain/entity/movie.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';
import 'package:movie_info_app/domain/usecase/fetch_movies_usecase.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  MockMovieRepository? mockMovieRepository;
  FetchMoviesUsecase? fetchMoviesUsecase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    fetchMoviesUsecase = FetchMoviesUsecase(mockMovieRepository!);
  });

  test('FetchMoviesUsecase test: fetchMovies', () async {
    when(() => mockMovieRepository!.fetchMovies()).thenAnswer((_) async => [
          Movie(
              title: 'title',
              released: 'released',
              runtime: 'runtime',
              director: 'director',
              actors: 'actors',
              poster: 'poster')
        ]);
    final result = await fetchMoviesUsecase!.execute();
    expect(result.length, 1);
    expect(result.first.title, 'title');
  });
}
