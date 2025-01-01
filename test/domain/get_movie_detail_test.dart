import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_info_app/domain/entity/movie_detail_entity.dart';
import 'package:movie_info_app/domain/repository/movie_repository.dart';
import 'package:movie_info_app/domain/usecase/get_movie_detail.dart';

// Mock class for MovieRepository
class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetMovieDetail getMovieDetail;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getMovieDetail = GetMovieDetail(mockMovieRepository);
  });

  const int tMovieId = 123;
  final tMovieDetailEntity = MovieDetailEntity(
    budget: 1000000,
    genres: ['Action', 'Drama'],
    id: tMovieId,
    productionCompanyLogos: ['/logo1.png', '/logo2.png'],
    overview: 'A great movie about testing.',
    popularity: 85.5,
    releaseDate: DateTime(2024, 12, 25),
    revenue: 5000000,
    runtime: 120,
    tagline: 'Testing is fun!',
    title: 'The Test Movie',
    voteAverage: 8.5,
    voteCount: 1500,
  );

  group('GetMovieDetail UseCase', () {
    test('should return MovieDetailEntity when the call is successful',
        () async {
      // Arrange
      when(() => mockMovieRepository.getMovieDetail(tMovieId))
          .thenAnswer((_) async => tMovieDetailEntity);

      // Act
      final result = await getMovieDetail(tMovieId);

      // Assert
      expect(result, tMovieDetailEntity);
      verify(() => mockMovieRepository.getMovieDetail(tMovieId)).called(1);
      verifyNoMoreInteractions(mockMovieRepository);
    });

    test('should throw an exception when the repository call fails', () async {
      // Arrange
      when(() => mockMovieRepository.getMovieDetail(tMovieId))
          .thenThrow(Exception('Failed to fetch movie details'));

      // Act
      expect(() => getMovieDetail(tMovieId), throwsException);

      // Assert
      verify(() => mockMovieRepository.getMovieDetail(tMovieId)).called(1);
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });
}
