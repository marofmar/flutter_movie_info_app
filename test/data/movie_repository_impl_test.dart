import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/data/data_source/movie_data_source.dart';
import 'package:movie_info_app/data/dto/movie_dto.dart';
import 'package:movie_info_app/data/repository/movie_repository_impl.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';

class MockMovieDataSource extends Mock implements MovieDataSource {
  //
}

void main() {
  //
  MovieRepositoryImpl? movieRepositoryImpl;
  MockMovieDataSource? mockMovieDataSource;
  setUp(() {
    //
    mockMovieDataSource = MockMovieDataSource();
    movieRepositoryImpl = MovieRepositoryImpl(mockMovieDataSource!);
  });

  test('MovieRepositoryImpl test: fetchMovies', () async {
    //Mock
    when(() => mockMovieDataSource!.fetchMovies()).thenAnswer((_) async => [
          MovieDto(
              title: 'title',
              released: 'released',
              runtime: 'runtime',
              director: 'director',
              actors: 'actors',
              poster: 'poster')
        ]);
    final result = await movieRepositoryImpl!.fetchMovies();
    expect(result.length, 1);
    expect(result.first.title, 'title');
  });
}
